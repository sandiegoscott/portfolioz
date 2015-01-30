class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string      :name, limit: 60
      t.timestamps
    end
  end
end
