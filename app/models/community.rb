class Community < ActiveRecord::Base
  has_many :residents
  has_many :articles, through: :residents
  
  #include Operation modules when needed
  
  attr_accessor :login_pwd
  
  #outdated!  use in controller, permit/require params
  #in the form, just allow name and password to be accessed
  # attr_accessible :name, :login_pwd, :password_confirmation
  
  # password is at least 8 long, contains one letter, one number
  LOGIN_PWD_REGEX = /\A^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\z/
  validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :login_pwd, :confirmation => true
  validates_format_of :login_pwd, :with => LOGIN_PWD_REGEX, :on => :create
  

  
  
  # encrypt password, then as it wil be in db, erase it
  before_save :encrypt_password
  after_save :clear_password
  
  def encrypt_password
    if login_pwd.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(login_pwd, salt)
    end
  end
  
  def clear_password
    self.password = nil
  end
  
end



 


