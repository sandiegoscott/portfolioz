class Source < ActiveRecord::Base

  belongs_to  :household

  validates_presence_of :household_id, :name

end
