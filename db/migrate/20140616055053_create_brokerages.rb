class CreateBrokerages < ActiveRecord::Migration
  def change
    create_table :brokerages do |t|
      t.references  :household
      t.string      :name, limit: 60
      t.decimal     :cash, precision: 12, scale: 2, default: 0.0, null: false
      t.timestamps
    end
  end
end
