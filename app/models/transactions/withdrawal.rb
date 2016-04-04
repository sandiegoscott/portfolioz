class Withdrawal < Transaction

  private

  def compute_cash_delta
    self.cash_delta = -amount
  end

end
