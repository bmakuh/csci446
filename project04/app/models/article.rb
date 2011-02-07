class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :author_name
  validates_exclusion_of :author_name, :in => %w( Sally ), :message => "Sally isn't allowed to post."
  
  #def inc_edit_count
  #  Article.increment_counter(:edit_count, :id)
  #end
end
