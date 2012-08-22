class AddColumnsToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :api_id, :string
    add_column :tournaments, :winning_share, :float
    add_column :tournaments, :purse, :float
  end
end
