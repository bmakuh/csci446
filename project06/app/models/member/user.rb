class Member::User < ActiveRecord::Base
  has_many :games
  acts_as_authentic

  belongs_to :role
  
  default_scope :include => [:role]
  
  def to_s
    full_name
  end
  
  def role_symbols
    [role.name.downcase.underscore.to_sym]
  end
end
