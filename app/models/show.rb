class Show < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :artists, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_one_attached :picture_1
  has_one_attached :picture_2

  validates_presence_of :video_link, :unless => lambda { self.video_link_title.blank? }
  validates_presence_of :third_thursday_talk_date, :unless => lambda { self.third_thursday_talk_title.blank? }

  def current?
    start_date <= Date.today && end_date >= Date.today
  end

  def picture_1_thumbnail
    return unless picture_1.attachment.present?
    picture_1.variant(resize: '150x150^', auto_orient: true, gravity: 'center', extent: '150x150')
  end

  def picture_2_thumbnail
    return unless picture_2.attachment.present?
    picture_2.variant(resize: '150x150^', auto_orient: true, gravity: 'center', extent: '150x150')
  end

  def picture_1_square
    return unless picture_1.attachment.present?
    picture_1.variant(resize: '300x300^', auto_orient: true, gravity: 'center', extent: '300x300')
  end

  def picture_2_square
    return unless picture_2.attachment.present?
    picture_2.variant(resize: '300x300^', auto_orient: true, gravity: 'center', extent: '300x300')
  end
end
