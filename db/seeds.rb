# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
99.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  password_confirmation = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password_confirmation)
end
              
users = User.order(:created_at).take(3)
50.times do
  task_name = Faker::Pokemon.name
  task_description = Faker::Lorem.sentence(15)
  users.each { |user| 
  user.tasks.create!(task_name: task_name,
                    task_description: task_description) }
end