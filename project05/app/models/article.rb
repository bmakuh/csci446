class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :author_name
  validate :no_author_named_sally
  
  before_save :increment_update_count
  
  private
    def increment_update_count
      self.edit_count += 1 unless self.new_record?
    end
    
    def no_author_named_sally
      errors.add_to_Base("Must not be named Sally due to prior childhood heartbreak.") if author_name.downcase.include? 'sally'
    end
  
end
