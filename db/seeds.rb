require 'faker'

rand(3..5).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
  u.skip_confirmation!
  u.save

end

rand(5..7).times do
  p = Team.create(team_name: Faker::Lorem.words(rand(1..2)).join(" "))

end

puts "Seed finished"
puts "#{Team.count} teams created"
puts "#{User.count} users created"

