class Title < ActiveRecord::Base
  has_many :identities
  has_many :conventioners, :through => :identities
end
