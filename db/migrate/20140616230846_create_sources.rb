class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.references  :household
      t.string      :name, limit: 60
      t.timestamps
    end
  end
end
