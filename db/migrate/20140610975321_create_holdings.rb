class CreateHoldings < ActiveRecord::Migration
  def change
    create_table :holdings do |t|
      t.references  :account
      t.references  :investment
      t.decimal     :shares, precision: 12, scale: 5
      t.timestamps
    end
  end
end
