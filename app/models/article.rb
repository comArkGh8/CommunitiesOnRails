
class Article < ApplicationRecord
  belongs_to :community
  belongs_to :resident

  # in order to treat request_array as actual array, use serialize:
  #serialize :request_array, Array
end
