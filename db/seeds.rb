users = []
10.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: '12345678',
    password_confirmation: '12345678'
  )
end

todos = []

100.times do
  todos << users.sample.items.create!(
    name: Faker::Simpsons.quote
  )
end

puts "Seed finished"
puts "#{users.count} users created"
puts "#{todos.count} items created"
