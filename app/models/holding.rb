class Holding < ActiveRecord::Base

  # account
  belongs_to            :account
  validates_presence_of :account_id

  # investment
  belongs_to            :investment
  validates_presence_of :investment_id

  # shares
  validates_presence_of :shares
  before_validation     :update_shares

  # ================ methods ================

  def update
    run_callbacks :save do
      # update_shares
      events_count = Transaction.where(account_id: self.account_id, investment_id: self.investment_id).count
      return if events_count == 0
      shares = Transaction.where(account_id: self.account_id, investment_id: self.investment_id).sum("shares_delta")

      save
    end
  end

  def update_shares
    events_count = Transaction.where(account_id: self.account_id, investment_id: self.investment_id).count
    return if events_count == 0
    self.shares = Transaction.where(account_id: self.account_id, investment_id: self.investment_id).sum("shares_delta")
  end

end
