class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.valid_email_regex

  before_save :downcase_email
  
  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validates :email, presence: true, length: {maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true,
    length: {minimum: Settings.minimum_pass}

  has_secure_password

  private

  def downcase_email
    self.email.downcase!
  end
end
