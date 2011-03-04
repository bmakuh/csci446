# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

require "faker"

30.times do
  #Game.create(:title => Faker::Company.catch_phrase,
  #            :rating => Faker::Company.bs,
  #            :created_at => Date.today,
  #            :user_id => 1 + rand(2)
  #            )
  User.create(:username => Faker::Name.name,
              :email => Faker::Internet.email,
              :password => "password",
              :password_confirmation => "password")
end
