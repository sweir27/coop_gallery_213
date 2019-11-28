class ConvertToActiveStorage < ActiveRecord::Migration[5.2]
  require 'open-uri'

  def up
    ActiveRecord::Base.connection.raw_connection.prepare("active_storage_blob_statement", <<-SQL)
      INSERT INTO active_storage_blobs (
        key, filename, content_type, metadata, byte_size, checksum, created_at
      ) VALUES ($1, $2, $3, '{}', $4, $5, $6)
    SQL

    ActiveRecord::Base.connection.raw_connection.prepare("active_storage_attachment_statement", <<-SQL)
      INSERT INTO active_storage_attachments (
        name, record_type, record_id, blob_id, created_at
      ) VALUES ($1, $2, $3, $4, $5)
    SQL

    Rails.application.eager_load!
    models = ActiveRecord::Base.descendants.reject(&:abstract_class?)

    transaction do
      models.each do |model|
        attachments = model.column_names.map do |c|
          if c =~ /(.+)_file_name$/
            $1
          end
        end.compact

        if attachments.blank?
          next
        end

        model.find_each.each do |instance|
          attachments.each do |attachment|
            if instance.send(attachment).path.blank?
              next
            end

            make_active_storage_records(instance, attachment, model)
          end
        end
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private

  def make_active_storage_records(instance, attachment, model)
    blob_key = key()
    filename = instance.send("#{attachment}_file_name")
    content_type = instance.send("#{attachment}_content_type")
    file_size = instance.send("#{attachment}_file_size")
    file_checksum = checksum(instance.send(attachment))
    created_at = instance.updated_at.iso8601

    blob_values = [blob_key, filename, content_type, file_size, file_checksum, created_at]

    ActiveRecord::Base.connection.raw_connection.exec_prepared(
      "active_storage_blob_statement",
      blob_values
    )

    last_blob_id = ActiveStorage::Blob.last.id

    blob_name = attachment
    record_type = model.name
    record_id = instance.id

    attachment_values = [blob_name, record_type, record_id, last_blob_id, created_at]
    ActiveRecord::Base.connection.raw_connection.exec_prepared(
      "active_storage_attachment_statement",
      attachment_values
    )
  end

  def key
    SecureRandom.uuid
  end

  def checksum(attachment)
    url = attachment.url
    Digest::MD5.base64digest(Net::HTTP.get(URI(url)))
  end
end
