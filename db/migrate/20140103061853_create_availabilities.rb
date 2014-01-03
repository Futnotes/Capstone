class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.references :user, index: true
      t.references :match, index: true

      t.timestamps
    end
  end
end
