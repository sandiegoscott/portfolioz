class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references  :source
      t.references  :investment
      t.date        :ddate
      t.timestamps
    end
  end
end
