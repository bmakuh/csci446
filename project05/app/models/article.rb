class Article < ActiveRecord::Base
  belongs_to :author
  
  validates_presence_of :title, :body
  
  before_save :increment_update_count
  
  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['name like ?', "%#{search}%"],
             :order => 'name'
  end
  
  private
    def increment_update_count
      self.edit_count += 1 unless self.new_record?
    end
    

  
end
