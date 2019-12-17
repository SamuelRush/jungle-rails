class User < ActiveRecord::Base
  validates :email, uniqueness: true, :case_sensitive => false
  validates :name, presence: true
  validates :password, presence: true, :length => {:minimum => 3 }
  before_save :downcase_fields
  has_secure_password
  
  def self.authenticate_with_credentials(email,password)
    email = email.strip
    email = email.downcase
    user = User.find_by_email(email)
    user if user && user.authenticate(password)
  end

  def downcase_fields
    self.email.downcase!
 end
end