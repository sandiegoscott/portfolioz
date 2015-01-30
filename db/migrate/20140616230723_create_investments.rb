class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.references  :household
      t.string      :symbol, limit: 20
      t.string      :name, limit: 60, default: ""
      t.timestamps
    end
  end
end
