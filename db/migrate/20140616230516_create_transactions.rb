class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer     :kind
      t.references  :investment
      t.references  :account
      t.references  :holding
      t.date        :ddate
      t.decimal     :cash_change, precision: 12, scale:2, default: 0.0
      t.decimal     :shares, precision: 12, scale: 5
      t.decimal     :price, precision: 12, scale: 5
      t.decimal     :amount, precision: 12, scale:2
      t.decimal     :commission, precision: 12, scale: 2, default: 0.0
      t.decimal     :shares_change, precision: 12, scale: 5
      t.decimal     :shares_before, precision: 12, scale: 5
      t.decimal     :shares_after, precision: 12, scale: 5
      t.string      :note, :limit => 140
      t.timestamps
    end
  end
end