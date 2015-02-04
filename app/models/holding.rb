class Holding < ActiveRecord::Base

  belongs_to  :investment
  belongs_to  :account

  has_many    :transactions

  validates   :account, presence: true, :unless => :new_record?
  validates   :investment, presence: true, :unless => :new_record?
  validates   :shares, presence: true

  before_validation     :compute_shares

  # ================ methods ================

  # message from Transaction
  def compute_shares
    return if transactions.count == 0
    shares = transactions.sum("shares_delta")
    self.update_attribute(:shares, shares)
  end

end
