require 'faker'

rand(5..7).times do
  p = Team.create(team_name: Faker::Lorem.words(rand(1..2)).join(" "))
end

puts "Seed finished"
puts "#{Team.count} seeds created"
