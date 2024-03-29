# Create a main sample user
User.create!(name: "Some User",
             email: "example@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# generate a bunch of additional users
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name, 
               email: email,
               password:              "password",
               password_confirmation: "password")
end