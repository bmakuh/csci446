class Member::Game < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :rating
  
  validates_presence_of :title, :rating
  
  def show
    @games = @user.games.find_all
  end
  
  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['title like ?', "%#{search}%"],
             :order => 'created_at DESC',
             :include => :user
  end
end
