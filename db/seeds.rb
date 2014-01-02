require 'faker'


#create 5 managers
5.times do
  password = Faker::Lorem.characters(10)
   u = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
    )
   
    u.save

    rand(1..2).times do
      u.teams.create(
       team_name: Faker::Lorem.words(rand(1..2)).join(" ")
      )
      TeamRole.last.update_attribute(:role, "manager")
    end
end



Team.all.each do |home_team|
  rand(3..4).times do
    t = Team.create(
      team_name: Faker::Lorem.words(rand(1..2)).join(" ")
      )
    home_team.matches.create(
      home_team_id: home_team.id,
      away_team_id: t.id,
      kick_off: Time.now + rand(600..3153600)
      )
  end

  rand(11..16).times do
    home_team.users.create(
      name: Faker::Name.name,
      )
    TeamRole.last.update_attribute(:role, "player")
  end
end

u = User.new(
  name: 'Member User Default',
  email: 'member@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.save

dummy_team = u.teams.create(
      team_name: "Fulham FC"
      )
      TeamRole.last.update_attribute(:role, "manager")
dummy_team.save

rand(3..4).times do
  t = Team.create(
    team_name: Faker::Lorem.words(rand(1..2)).join(" ")
     )
  dummy_team.matches.create(
    home_team_id: dummy_team.id,
    away_team_id: t.id,
    kick_off: Time.now + rand(600..3153600)
    )

  11.times do
    dummy_team.users.create(
      name: Faker::Name.name,
      )
    TeamRole.last.update_attribute(:role, "player")
  end
end

#Team.all.each do |home_team|
  #rand(3..4).times do
   # t = Team.create(
    #  team_name: Faker::Lorem.words(rand(1..2)).join(" ")
     # )
   # home_team.matches.create(
    #  home_team_id: home_team.id,
     # away_team_id: t.id,
      #kick_off: Time.now + rand(600..3153600)
      #)
 # end
 

puts "Seed finished"
puts "#{Team.count} teams created"
puts "#{User.count} users created"
puts "#{TeamRole.count} team roles created"
puts "#{Match.count} matches created"

