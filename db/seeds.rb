# Create Users
3.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.unique.password
  )
end
users = User.all

user = User.first
user.update_attributes!(
  email: 'jjw244@utexas.edu',
  password: 'fakefakefake',
  confirmed_at: Time.now
)

# Create Applications
10.times do
  RegisteredApplication.create!(
    name: Faker::Lorem.word,
    url: Faker::Internet.url,
    user: User.first
  )
end
regapps = RegisteredApplication.all

# Create Events
50.times do
  Event.create!(
    name: Faker::Lorem.word,
    registered_application: regapps.sample
  )
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
