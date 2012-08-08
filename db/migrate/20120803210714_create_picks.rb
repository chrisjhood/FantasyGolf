class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :earnings
      t.integer :golfer_id
      t.integer :tournament_id
      t.integer :user_id

      t.timestamps
    end
  end
end
