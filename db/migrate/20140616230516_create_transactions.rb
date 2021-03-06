class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string      :type, limit: 12
      t.string      :subtype, limit: 12
      t.references  :investment
      t.references  :account
      t.references  :holding
      t.date        :ddate
      t.decimal     :shares, precision: 12, scale: 5
      t.decimal     :price, precision: 12, scale: 5
      t.decimal     :commission, precision: 12, scale: 2
      t.decimal     :amount, precision: 12, scale:2
      t.decimal     :cash_delta, precision: 12, scale:2, default: 0.0
      t.decimal     :shares_delta, precision: 12, scale: 5
      t.decimal     :shares_before, precision: 12, scale: 5
      t.decimal     :shares_after, precision: 12, scale: 5
      t.string      :note, :limit => 140
      t.timestamps
    end
  end
end