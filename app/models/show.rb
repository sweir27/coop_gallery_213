class Show < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :artists, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_attached_file :picture_1,
            :styles =>
              { :medium => "300x300>", :thumb => "150x150#" }
            # :path => ":rails_root/public/system/:attachment/:slug/:style/:basename.:extension",
            # :url  => "/public/:attachment/:slug/:style/:basename.:extension"
  validates_attachment_content_type :picture_1, :content_type => /\Aimage\/.*\Z/
  has_attached_file :picture_2,
            :styles =>
              { :medium => "300x300>", :thumb => "150x150#" }
            # :path => ":rails_root/public/system/:attachment/:slug/:style/:basename.:extension",
            # :url  => "/public/:attachment/:slug/:style/:basename.:extension"
  validates_attachment_content_type :picture_2, :content_type => /\Aimage\/.*\Z/
end
