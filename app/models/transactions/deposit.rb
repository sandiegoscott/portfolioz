class Deposit < Transaction

  private

  def compute_cash_delta
    self.cash_delta = self.amount
  end

end
