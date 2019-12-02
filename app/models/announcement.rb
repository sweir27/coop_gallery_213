class Announcement < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  validates_presence_of :pdf, :unless => lambda { self.pdf_title.blank? }

  has_one_attached :announcement_image
  has_one_attached :pdf

  # TODO: validate content type for pdf

  def thumbnail
    announcement_image.variant(resize: '150x150^', auto_orient: true, gravity: 'center', extent: '150x150')
  end
end
