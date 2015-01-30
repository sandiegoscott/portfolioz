class Recommendation < ActiveRecord::Base

  belongs_to  :source
  belongs_to  :investment

  #has_many    :positions
  has_many    :transactions
  
  validates_presence_of   :source_id, :investment_id

end
