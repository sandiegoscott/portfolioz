class Account < ActiveRecord::Base

  belongs_to  :brokerage

  has_many    :holdings, :dependent => :destroy
  has_many    :transactions, :dependent => :destroy

  validates   :brokerage, presence: true
  validates   :name, presence: true

  after_save  :update_brokerage_cash

  # ================ methods ================

  def update_brokerage_cash
    brokerage.update_cash
  end

  def update_cash
    return if transactions.count == 0
    ccash = transactions.sum("cash_change")
    self.update_attribute(:cash, ccash)
    #puts ">>>>> /Account#update_cash/  cash=#{ccash}  transactions_count=#{transactions_count}"
  end

end
