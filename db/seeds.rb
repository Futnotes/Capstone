require 'faker'


#create 5 users
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

Team.all.each do |team|
  rand(3..4).times do
    team.matches.create(
      team: team,
      team_two_name: Faker::Lorem.words(rand(1..2)).join(" "),
      kick_off: Time.now + rand(600..3153600)
      )
  end
end

u = User.new(
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
end
 

 

puts "Seed finished"
puts "#{Team.count} teams created"
puts "#{User.count} users created"
puts "#{TeamRole.count} team roles created"
puts "#{Match.count} matches created"

