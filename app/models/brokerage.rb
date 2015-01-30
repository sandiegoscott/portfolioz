class Brokerage < ActiveRecord::Base

  belongs_to  :household

  has_many    :accounts, :dependent => :destroy

  validates_presence_of  :household_id, :name

  # ================ methods ================

  def update_cash
    cash = 0.0
    self.accounts.each do |account|
      #account.recalculate
      cash += account.cash
    end
    self.update_attribute(:cash, cash)
  end

end