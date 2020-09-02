class Artwork < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true

  has_one_attached :image

  def thumbnail
    return unless image.attached? && image.variable?

    image.variant(resize: '150x150^', auto_orient: true, gravity: 'center', extent: '150x150')
  end

  def large_image
    image.variant(resize: 'x600', auto_orient: true)
  end
end
