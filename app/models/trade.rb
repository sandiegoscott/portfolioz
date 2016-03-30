class Trade < Transaction

  # STI--types of trades:
  # buy, cover, sell, short

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

  before_validation   :compute_shares_delta

  after_save          :update_holding

  private

  def set_subtype
    self.subtype = 'Trade'
  end

  def update_holding
    holding.compute_shares if holding
  end

end
