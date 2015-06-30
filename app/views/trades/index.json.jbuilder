json.array!(@trades) do |trade|
  json.extract! trade, :id, :type, :subtype, :investment_id, :account_id, :holding_id, :ddate, :shares, :price, :commission, :amount, :cash_delta, :shares_delta, :shares_before, :shares_after, :note
  json.url trade_url(trade, format: :json)
end
