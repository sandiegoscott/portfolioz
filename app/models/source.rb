class Source < ActiveRecord::Base

  belongs_to  :household

  validates   :household, presence: true, :unless => :new_record?
  validates   :name, presence: true

end
