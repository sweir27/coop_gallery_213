class Announcement < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  validates_presence_of :pdf, :unless => lambda { self.pdf_title.blank? }

  has_one_attached :announcement_image

  has_attached_file :pdf
  validates_attachment_content_type :pdf,
      :content_type => [ 'application/pdf' ],
      :message => "Please upload a valid pdf."
end
