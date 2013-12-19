class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :value
      t.references :user, index: true
      t.references :match, index: true

      t.timestamps
    end
  end
end
