class Site < ActiveRecord::Base
  has_one_attached :home_image
  has_one_attached :about_image

  has_one_attached :supporting_member_pdf
  has_one_attached :exhibiting_member_pdf

  def home_image_thumbnail
    return unless home_image.attachment.present?
    home_image.variant(resize: '400x200^', auto_orient: true, gravity: 'center', extent: '400x200')
  end

  def about_image_thumbnail
    return unless about_image.attachment.present?
    about_image.variant(resize: '200x200^', auto_orient: true, gravity: 'center', extent: '200x200')
  end

  def about_image_meta
    return unless about_image.attachment.present?
    about_image.variant(resize: '1200x1200^', auto_orient: true, gravity: 'center', extent: '1200x1200')
  end
end
