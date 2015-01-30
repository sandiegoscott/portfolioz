class Investment < ActiveRecord::Base

  #belongs_to  :household
  #validates_presence_of  :household_id

  has_many  :splits, :dependent => :destroy

  validates_presence_of  :name

  # ================ methods ================

  def latest_price
    #price = (3000 + rand(7000) / 100
    #BigDecimal.new(price, 12)
    BigDecimal(22.44, 12)
  end

end