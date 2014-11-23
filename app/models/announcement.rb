class Announcement < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  has_attached_file :announcement_image,
                    :styles =>
                      { :thumb => "150x150#", :largethumb => "250x250#" }
  validates_attachment_content_type :announcement_image, :content_type => /\Aimage\/.*\Z/
end
