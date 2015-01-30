class Split < ActiveRecord::Base

  belongs_to            :investment
  validates_presence_of :investment_id

  validates_presence_of :shares_before, :shares_after

end
