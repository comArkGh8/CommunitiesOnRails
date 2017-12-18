class Community < ActiveRecord::Base
  has_many :residents
  has_many :articles, through: :residents
  
  #include Operation modules when needed
  
end



 


