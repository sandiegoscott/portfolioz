class Transaction < ActiveRecord::Base

  # STI--types of transactions:
  # deposit, withdrawal, expense, interest, dividend

  belongs_to  :account
  belongs_to  :investment  # used only for dividend and optionally for expense

  validates   :account, presence: true
  validates   :ddate, presence: true
  
  validates   :cash_delta, numericality: true  # all transactions produce a cash change
  
  attr_accessor :date_str  # can supply date as a string

  before_validation   :set_date, :set_subtype
  after_save          :update_account

  private

  def set_date
    self.ddate = Date.parse(date_str) if date_str
    self.ddate ||= Date.today  # uninitialized date means today
  end

  def set_subtype
    self.subtype = 'Transaction'
  end

  def update_account
    account.compute_cash if account
  end

  # use if necessary
  # raise NotImplementedError
  
end
