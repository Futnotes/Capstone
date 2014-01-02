class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :home_team, index: true
      t.references :away_team, index: true 
      t.datetime :kick_off

      t.timestamps
    end
  end
end
