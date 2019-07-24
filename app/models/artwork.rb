class Artwork < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  has_attached_file :image,
            :styles =>
              { :medium => "300x300>", :thumb => "150x150#", :large_square => "300x300#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
