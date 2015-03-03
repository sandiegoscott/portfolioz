class Transaction < ActiveRecord::Base

  # STI--types of transactions:
  # deposit, withdrawal, expense, interest, dividend, buy, cover, sell, short

  belongs_to  :account

  validates   :account, presence: true  #,  :unless => :new_record?
  validates   :ddate, presence: true
  
  validates   :cash_delta, numericality: true  # all transactions produce a cash change
  
  attr_accessor :date_str  # can supply date as a string

  before_validation   :set_date, :compute_cash_delta  # , :compute_shares_delta
  after_save          :update_account #, :update_holding

  private

  def set_date
    #puts ">>>>> /Transaction#set_date/"
    self.ddate = Date.parse(date_str) if date_str
    self.ddate ||= Date.today  # uninitialized date means today
  end

  def update_account
    #puts ">>>>> /Transaction#update_account/"
    account.compute_cash if account
  end

end
