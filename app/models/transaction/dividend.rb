class Transaction::Dividend < ActiveType::Record[Transaction]

  belongs_to  :investment

  validates   :investment, presence: true

  before_validation   :compute_cash_delta

  private

  def compute_cash_delta
    self.cash_delta = amount
  end

end
