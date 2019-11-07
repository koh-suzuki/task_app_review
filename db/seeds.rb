# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password")
              

50.times do |n|
  name = ""s
  Task.create!( 
            )
end
