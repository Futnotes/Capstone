class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :team, index: true
      t.string :team_two_name
      t.datetime :kick_off

      t.timestamps
    end
  end
end
