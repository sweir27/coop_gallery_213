class Artwork < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  has_attached_file :image,
            :styles =>
              { :medium => "300x300>", :thumb => "200x200#" }
            # :path => ":rails_root/public/system/:attachment/:slug/:style/:basename.:extension",
            # :url  => "/public/:attachment/:slug/:style/:basename.:extension"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
