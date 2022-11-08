10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               )
end

User.create!(name: "aiueo", email: "aiueodayo@gmail.com", password: "123456", admin: true)