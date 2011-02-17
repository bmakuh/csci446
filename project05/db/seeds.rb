# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

require 'rubygems'
require 'faker'

@articles = Article.find(:all)

for i in 1..15
  articles = Article.create([ :title => Faker::Lorem.words(rand(7)+1).join(' ').capitalize,
                           :author_name => Faker::Name.name, :body => Faker::Lorem.paragraphs(rand(4)+1).join(' '),
                           :created_at => Date.today,
                           :id => i])
end