class Investment < ActiveRecord::Base

  has_many    :splits, :dependent => :destroy

  validates   :name, presence: true

  # ================ methods ================

  def latest_price
    #price = (3000 + rand(7000) / 100
    #BigDecimal.new(price, 12)
    BigDecimal(22.44, 12)
  end

end
