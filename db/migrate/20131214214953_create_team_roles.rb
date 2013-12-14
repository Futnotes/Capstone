class CreateTeamRoles < ActiveRecord::Migration
  def change
    create_table :team_roles do |t|
      t.references :user, index: true
      t.references :team, index: true
      t.string :role

      t.timestamps
    end
  end
end
