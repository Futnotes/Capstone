class RemoveDetailsFromMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :team_one_score, :integer
    remove_column :matches, :team_two_score, :integer
  end
end
