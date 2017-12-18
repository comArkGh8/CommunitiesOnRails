
class Resident < ActiveRecord::Base
  belongs_to :community
  
  has_many :articles
end
