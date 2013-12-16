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


puts "Seed finished"
puts "#{Team.count} teams created"
puts "#{User.count} users created"
puts "#{TeamRole.count} team roles created"