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
    home_team.matches.create(
      home_team: team,
      away_team: Faker::Lorem.words(rand(1..2)).join(" "),
      kick_off: Time.now + rand(600..3153600)
      )
  end

  rand(11..16).times do
    team.users.create(
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

t = u.teams.create(
      team_name: "Fulham FC"
      )
      TeamRole.last.update_attribute(:role, "manager")
t.save

rand(3..4).times do
  t.matches.create(
    team_two_name: Faker::Lorem.words(rand(1..2)).join(" "),
    kick_off: Time.now + rand(600..3153600)
    )

  11.times do
    t.users.create(
      name: Faker::Name.name,
      )
    TeamRole.last.update_attribute(:role, "player")
  end
end

 

puts "Seed finished"
puts "#{Team.count} teams created"
puts "#{User.count} users created"
puts "#{TeamRole.count} team roles created"
puts "#{Match.count} matches created"

