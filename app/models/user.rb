class User < ActiveRecord::Base
  before_save :encrypt_password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :presence => true, length: { minimum: 3 }
  validates :email, :presence => true, :uniqueness => true, :format => email_regex
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create



  def encrypt_password
    if password.present?
      self.password = Digest::SHA1.hexdigest(password)
    end
  end

  def self.authenticate(email="", password="")
    user = User.find_by_email(email)
    if user && user.check_password(password)
      return user
    else
      return false
    end
  end
  def check_password(password="")
    Digest::SHA1.hexdigest(password)
  end
end
