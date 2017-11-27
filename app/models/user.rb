class User < ActiveRecord::Base
    before_save { self.emailID = emailID.downcase }
    validates :username,  presence: true, length: { maximum: 15 }, uniqueness: true
    validates :password,  presence: true, length: { maximum: 15 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :emailID, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
