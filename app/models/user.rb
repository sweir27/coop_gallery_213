class User < ActiveRecord::Base
  has_many :artworks, dependent: :destroy
  before_save { self.email = email.downcase }
  before_save { self.slug = create_slug }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  Paperclip.interpolates :slug do |attachment, style|
    attachment.instance.slug
  end

  has_attached_file :pic,
            :styles =>
              { :medium => "300x300>", :thumb => "100x100#" }
            # :path => ":rails_root/public/system/:attachment/:slug/:style/:basename.:extension",
            # :url  => "/public/:attachment/:slug/:style/:basename.:extension"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

    def create_slug
      return self.name.downcase.gsub(" ", "-")
    end

end