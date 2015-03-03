class Transaction::Sell < ActiveType::Record[Transaction]

  belongs_to  :investment
  belongs_to  :holding

  validates   :investment, presence: true
  validates   :holding, presence: true

  # validations for trades
  validates   :shares, presence: true
  validates   :shares, :numericality => { :greater_than => 0 }
  validates   :price, presence: true
  validates   :price, :numericality => { :greater_than => 0 }
  validates   :commission, presence: true
  validates   :commission, :numericality => { :greater_than_or_equal_to => 0 }
  validates   :shares_delta, :numericality => true

  private

  def compute_cash_delta
    if shares.nil? || price.nil?
      self.cash_delta = nil
    else
      self.cash_delta = shares * price - commission
    end
  end

  def compute_shares_delta
    self.shares_delta = -shares
  end

end
