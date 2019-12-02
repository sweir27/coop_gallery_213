class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  validates_presence_of :pdf, :unless => lambda { self.pdf_title.blank? }

  has_one_attached :pdf

  # TODO: File validation for PDF
end
