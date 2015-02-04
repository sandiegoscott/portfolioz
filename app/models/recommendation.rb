class Recommendation < ActiveRecord::Base

  belongs_to  :investment
  belongs_to  :source

  has_many    :transactions

  validates  :investment, presence: true, :unless => :new_record?
  validates  :source, presence: true, :unless => :new_record?
  validates  :ddate, presence: true

  before_validation  :assign_date

  private

  def assign_date
    self.ddate ||= Date.today
  end

end
