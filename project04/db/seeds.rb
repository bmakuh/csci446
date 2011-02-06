# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

articles = Article.create([ :title => 'Lorem Ipsum', :author_name => 'Robert Frost',
                           :body => 'Robert Lee Frost (March 26, 1874 – January 29, 1963) was an American poet. He is highly regarded for his realistic depictions of rural life and his command of American colloquial speech.[1] His work frequently employed settings from rural life in New England in the early twentieth century, using them to examine complex social and philosophical themes. A popular and often-quoted poet, Frost was honored frequently during his lifetime, receiving four Pulitzer Prizes for Poetry.'])