class Game < ActiveRecord::Base
  attr_accessible :title, :rating
  
  validates_presence_of :title, :rating
  
  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['title like ?', "%#{search}%"],
             :order => 'title'
  end
end
