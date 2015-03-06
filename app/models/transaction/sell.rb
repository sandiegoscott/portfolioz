class Sell < Trade

  before_validation   :compute_cash_delta, :compute_shares_delta

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
