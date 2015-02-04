class Brokerage < ActiveRecord::Base

  belongs_to  :household

  has_many    :accounts, :dependent => :destroy

  validates   :household, presence: true, :unless => :new_record?
  validates   :name, presence: true

  # ================ methods ================

  def update_cash
    return if accounts.count == 0
    ccash = self.accounts.sum("cash")
    self.update_attribute(:cash, ccash)
    #puts ">>>>> /Brokerage#update_cash/  cash=#{ccash}  accounts_count=#{accounts_count}"
  end

end
