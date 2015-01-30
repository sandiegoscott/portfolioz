class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references  :brokerage
      t.string      :name, limit: 60
      t.decimal     :value, precision: 12, scale: 2, default: 0
      t.decimal     :cash, precision: 12, scale: 2, default: 0.0, null: false
      t.timestamps
    end
  end
end
