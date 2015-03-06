class Deposit < Transaction

  before_validation   :compute_cash_delta

  private

  def compute_cash_delta
    self.cash_delta = self.amount
  end

end
