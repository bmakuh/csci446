class Author < ActiveRecord::Base
  has_many :articles
  has_attached_file :photo,
                    :url => '/assets/:class/:attachment/:id/:style/:filename'
  
  validates_presence_of :name
  validate :no_author_named_sally
  
  def to_s
    name
  end
  
  private
  
    def no_author_named_sally
      errors.add_to_base("Must not be named Sally due to prior childhood heartbreak.") if name.downcase.include? 'sally'
    end
end
