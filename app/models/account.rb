class Account < ActiveRecord::Base

  belongs_to  :brokerage

  has_many    :holdings, :dependent => :destroy
  has_many    :transactions, :dependent => :destroy

  validates   :brokerage, presence: true, :unless => :new_record?
  validates   :name, presence: true

  before_validation   :compute_cash
  after_save          :update_brokerage_cash

  # ================ methods ================

  # message from Transaction
  def compute_cash
    return if transactions.count == 0
    ccash = transactions.sum("cash_delta")
    self.update_attribute(:cash, ccash)
  end

  # message to Brokerage
  def update_brokerage_cash
    brokerage.update_cash if brokerage
  end

end
