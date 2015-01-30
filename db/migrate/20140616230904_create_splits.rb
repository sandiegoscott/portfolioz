class CreateSplits < ActiveRecord::Migration
  def change
    create_table :splits do |t|
      t.references  :investment
      t.date        :ddate
      t.decimal     :shares_before, precision: 12, scale: 5
      t.decimal     :shares_after, precision: 12, scale: 5
      t.timestamps
    end
  end
end
