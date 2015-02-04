class Split < ActiveRecord::Base

  belongs_to  :investment

  validates   :investment, presence: true, :unless => :new_record?
  validates   :shares_before, presence: true
  validates   :shares_after, presence: true
  validates   :ddate, presence: true

  before_validation  :assign_date

  private

  def assign_date
    self.ddate ||= Date.today
  end

end
