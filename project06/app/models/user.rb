class User < ActiveRecord::Base
  has_many :games
  acts_as_authentic

  belongs_to :role
  
  has_attached_file :photo, :url => "#{RAILS_ROOT}/public/assets/:class/:attachment/:id/:basename.:extension",
                            :path => "#{RAILS_ROOT}/public/assets/:class/:attachment/:id/:basename.:extension"
  
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  default_scope :include => [:role]
  
  def to_s
    full_name
  end
  
  def role_symbols
    [role.name.downcase.underscore.to_sym]
  end
end
