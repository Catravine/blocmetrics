# Create some users
4.times do
  User.create!(
    email: Faker::Internet.email,
    password: "helloworld",
    password_confirmation: "helloworld",
    confirmed_at: Date.today,
  )
end

# Create a user for my primary email
User.create!(
  email: "caroline@carolinecourtney.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  confirmed_at: Date.today
)

# Total Users
users = User.all

# Create Registered Applications
20.times do
  RegisteredApplication.create(
    name: Faker::App.name,
    url: Faker::Internet.url,
    user: users.sample
    )
end

# Total Apps
regapps = RegisteredApplication.all

# Total Users
users = User.all

# Create regapp Events
60.times do
  Event.create(
    name: Faker::Company.bs,
    registered_application: regapps.sample
    )
end

# Total Apps
events = Event.all

# Results
puts "Seed Finished..."
puts "#{User.count} total users created"
puts "#{RegisteredApplication.count} total regapss created"
puts "#{Event.count} events created"
