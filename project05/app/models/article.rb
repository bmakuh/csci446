class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :author_name
  validates_exclusion_of :author_name, :in => %w( Sally ), :message => "Sally isn't allowed to post."
  
  before_save :increment_update_count
  
  private
    def increment_update_count
      self.edit_count += 1 unless self.new_record?
    end
  
end
