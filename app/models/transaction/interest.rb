class Transaction::Interest < ActiveType::Record[Transaction]

  before_validation   :compute_cash_delta

  private

  def compute_cash_delta
    self.cash_delta = amount
  end

end
