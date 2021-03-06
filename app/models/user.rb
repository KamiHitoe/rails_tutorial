class User < ApplicationRecord
  
  # valid when put user into db
  before_save {self.email = self.email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50}
  validates :email, 
    presence: true,
    length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  has_secure_password
  
  attr_accessor :remember_token
  
  # return hash of sent string
  def User.digest(string) # class method
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # return random token that has 22 length
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # store hashed token on user
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # validate props with digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # overwrite user's remember_digest to nil
  def forget
    update_attribute(:remember_digest, nil)
  end

end
