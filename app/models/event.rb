class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  has_attached_file :event_image,
            :styles =>
              { :medium => "300x300>", :thumb => "150x150#", :largethumb => "250x250#" }
            # :path => ":rails_root/public/system/:attachment/:slug/:style/:basename.:extension",
            # :url  => "/public/:attachment/:slug/:style/:basename.:extension"
  validates_attachment_content_type :event_image, :content_type => /\Aimage\/.*\Z/
end
