class Trade < Transaction

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

  after_save          :update_holding

  private

  def update_holding
    holding.compute_shares if holding
  end

end
