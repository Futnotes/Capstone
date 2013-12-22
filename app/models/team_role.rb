  #t.integer  "user_id"
    #t.integer  "team_id"
    #t.string   "role"
    #t.datetime "created_at"
    #t.datetime "updated_at"

class TeamRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
end
