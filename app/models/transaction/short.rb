class Short < Trade

  before_validation   :compute_quantities

  private

  def compute_quantities
    if shares.nil? || price.nil?
      self.amount = nil
      self.cash_delta = nil
    else
      self.amount = shares * price - commission
      self.cash_delta = amount
    end
    self.shares_delta = shares.nil? ? nil : -shares
  end

end
