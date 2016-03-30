class Cover < Trade

  before_validation   :compute_cash_delta

  private

  def compute_cash_delta
    #puts ">>>>> /Transaction::Buy#compute_cash_delta/"
    if shares.nil? || price.nil?
      cash_delta = nil
    else
      cash_delta = -(shares * price + commission)
    end
  end

end