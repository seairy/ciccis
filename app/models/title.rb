class Title < ActiveRecord::Base
  has_many :identities
  has_many :conventioners, :through => :identities
  scope :sorted, order('name ASC')
end
