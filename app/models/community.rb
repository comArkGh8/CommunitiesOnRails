class Community < ActiveRecord::Base
  has_many :residents
  has_many :articles, through: :residents
  
  #include Operation modules when needed
  
  attr_accessor :login_pwd
  
  # password is at least 8 long, contains one letter, one number
  LOGIN_PWD_REGEX = /\A^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\z/
  validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :login_pwd, :confirmation => true
  validates_format_of :login_pwd, :with => LOGIN_PWD_REGEX, :on => :create
  
end



 


