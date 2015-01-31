class Transaction < ActiveRecord::Base

  # types of transactions:
  enum kind: [:buy, :cover, :deposit, :dividend, :expense, :interest, :sell, :short, :withdrawal]

  # associations
  belongs_to  :account
  belongs_to  :investment
  belongs_to  :holding

  # validate associations
  validates   :account, presence: true
  validates   :investment, presence: true, :if => :is_trade_or_dividend?
  validates   :holding, presence: true, :if => :is_trade?

  # validate date
  validates   :ddate, presence: true

  # all transactions produce a cash change
  validates   :cash_change, presence: true, numericality: true

  # validations for trades
  validates   :shares, presence: true, :if => :is_trade?
  validates   :shares, :numericality => { :greater_than => 0 }, :if => :is_trade?
  validates   :price, presence: true, :if => :is_trade?
  validates   :price, :numericality => { :greater_than => 0 }, :if => :is_trade?
  validates   :commission, presence: true, :if => :is_trade?
  validates   :commission, :numericality => { :greater_than_or_equal_to => 0 }, :if => :is_trade?
  validates   :shares_change, :numericality => true, :if => :is_trade?

  # can supply date as a string
  attr_accessor :date_str

  # callbacks
  before_validation   :compute_date, :if => :date_str
  before_validation   :compute_changes
  before_save         :check_valid
  after_save          :update_account, :update_holding

  private

  def compute_date
    ddate = Date.parse(date_str) if date_str
  end

  def update_account
    puts ">>>> /Transaction#update_account/"
    account.update_cash
  end

  def update_holding
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
    elsif is_trade?
      if shares.nil?
        shares_change = nil
        cash_change = nil
      else
        shares_change = (buy? || cover?) ? shares : -shares
        puts ">>>> self.inspect=#{self.inspect}"
        if price.nil?
          cash_change = nil
        else
          cash_change = shares * price - commission
          cash_change = -cash_change if buy? || cover?
        end
      end
    end
    puts ">>>> self.inspect=#{self.inspect}"
  end

  def check_valid
    puts ">>>> /check_valid?  self.valid?=#{self.valid?}"
  end

  def is_cash_only?
    deposit? || withdrawal?
  end

  def is_trade?
    buy? || cover? || sell? || short?
  end

  def is_trade_or_dividend?
    is_trade? || dividend?
  end

end
