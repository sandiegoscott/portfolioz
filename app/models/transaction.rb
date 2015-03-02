class Transaction < ActiveRecord::Base

  # types of transactions:
  # enum kind: [:deposit, :withdrawal, :expense, :interest, :dividend, :buy, :cover, :sell, :short]

  # associations
  #belongs_to  :investment
  belongs_to  :account
  #belongs_to  :holding

  # validate associations
  #validates   :investment, presence: true, :if => :trade_or_dividend?, :unless => :new_record?
  validates   :account, presence: true, :unless => :new_record?
  #validates   :holding, presence: true, :if => :trade?, :unless => :new_record?

  # validate date
  validates   :ddate, presence: true

  # all transactions produce a cash change
  validates   :cash_delta, numericality: true  # , presence: true

  # trades produce a shares change
  #validates   :shares_delta, :numericality => true, :if => :trade?

  # other validations for trades
  #validates   :shares, presence: true, :if => :trade?
  #validates   :shares, :numericality => { :greater_than => 0 }, :if => :trade?
  #validates   :price, presence: true, :if => :trade?
  #validates   :price, :numericality => { :greater_than => 0 }, :if => :trade?
  #validates   :commission, presence: true, :if => :trade?
  #validates   :commission, :numericality => { :greater_than_or_equal_to => 0 }, :if => :trade?

  # can supply date as a string
  attr_accessor :date_str

  # callbacks
  before_validation   :set_date #, :compute_cash_delta, :compute_shares_delta
  after_save          :update_account #, :update_holding

  private
=begin
  def trade?
    buy? or cover? or sell? or short?
  end

  def trade_or_dividend?
    trade? or dividend?
  end
=end
  def set_date
    #puts ">>>>> /set_date/"
    self.ddate = Date.parse(date_str) if date_str
    self.ddate ||= Date.today  # uninitialized date means today
  end
=begin
  def compute_cash_delta
    #puts ">>>>> /compute_cash_delta/"
    if trade?
      if shares.nil?
        cash_delta = nil
      else
        if price.nil?
          cash_delta = nil
        else
          cash_delta = shares * price
          cash_delta = -cash_delta if buy? or cover?
          cash_delta -= commission
        end
      end
    else # if :deposit, :withdrawal, :expense, :interest, :dividend
      if amount.nil?
        cash_delta = nil
      else
        cash_delta = (deposit? or interest? or dividend?) ? amount : -amount
      end
    end
    self.cash_delta = cash_delta
  end

  def compute_shares_delta
    #puts ">>>>> /compute_shares_delta/"
    return unless trade?
    if shares.nil?
      self.shares_delta = nil
    else
      if (buy? or cover?)
        self.shares_delta = self.shares
      else
        self.shares_delta = -self.shares
      end
    end
  end
=end
  def update_account
    #puts ">>>>> /update_account/"
    account.compute_cash if account
  end
=begin
  def update_holding
    #puts ">>>>> /update_holding/"
    holding.compute_shares if holding
  end
=end
end
