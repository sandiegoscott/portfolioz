class Account < ActiveRecord::Base

  belongs_to  :brokerage

  has_many    :holdings, :dependent => :destroy

  has_many    :transactions, :dependent => :destroy

  validates_presence_of  :brokerage_id, :name, :cash

  validates_presence_of :cash
  before_validation  :update_cash

  # ================ methods ================

  def update_cash
    transactions_count = self.transactions.count
    return if transactions_count == 0
    ccash = self.transactions.sum("cash_change")
    self.update_attribute(:cash, ccash)
  end

end
