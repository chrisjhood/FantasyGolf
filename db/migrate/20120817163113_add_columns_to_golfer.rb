class AddColumnsToGolfer < ActiveRecord::Migration
  def change
    add_column :golfers, :api_id, :string
    add_column :golfers, :first_name, :string
    add_column :golfers, :last_name, :string
  end
end
