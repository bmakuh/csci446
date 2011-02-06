class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :author_name
  
end
