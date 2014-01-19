class AddScoreUpdatedToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :score_updated, :boolean
  end
end
