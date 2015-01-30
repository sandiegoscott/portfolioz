class Transaction < ActiveRecord::Base

  # types of transactions:
  enum kind: [:buy, :cover, :deposit, :dividend, :expense, :interest, :sell, :short, :withdrawal]

  # associations
  belongs_to  :account
  belongs_to  :investment
  belongs_to  :holding

  # validate associations
  validates   :account, presence: true
  validates   :investment, presence: true, :if => :has_investment?
  validates   :holding, presence: true, :if => :is_trade?  # NEED TO ADD || dividend? }

  # validate date
  validates   :ddate, presence: true

  # all transactions produce a cash change
  validates   :cash_change, presence: true
  validates   :cash_change, :numericality => true

  # validations for trades
  validates   :shares, presence: true, :if => :is_trade?
  validates   :shares, :numericality => { :greater_than => 0 }, :if => :is_trade?
  validates   :price, presence: true, :if => :is_trade?
  validates   :price, :numericality => { :greater_than => 0 }, :if => :is_trade?
  validates   :commission, presence: true, :if => :is_trade?
  validates   :commission, :numericality => { :greater_than_or_equal_to => 0 }, :if => :is_trade?
  validates   :shares_change, :numericality => true, :if => :is_trade?

  # callbacks
  after_save  :update_associations

  # supply date as a string
  attr_accessor :date_str
  before_validation :compute_date, :if => :date_str

  # callbacks
  before_validation  :compute_changes       # all subclasses must have this method
  after_save         :update_associations

  private

  def compute_date
    ddate = Date.parse(date_str) if date_str
  end

  def update_associations
    account.update_cash
    holding.update_shares if holding
  end

  # Transaction::before_validation
  def compute_changes
    if deposit? || withdrawal?
      if amount.nil?
        cash_change  = nil
      else
        cash_change = deposit? ? amount : -amount
      end
    elsif buy? || cover? || sell? || short?
      if shares.nil?
        shares_change = nil
        cash_change = nil
      else
        shares_change =(buy? || cover?) ? shares : -shares
        if price.nil?
          cash_change = nil
        else
          cash_change = shares * price - commission
          cash_change = -cash_change if buy? || cover?
        end
      end
    end
  end

  def has_investment?
    buy? || cover? || dividend? || sell? || short?
  end

  def is_trade?
    buy? || cover? || sell? || short?
  end

end
