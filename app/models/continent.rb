class Continent < ActiveRecord::Base
  has_many :countries
  has_many :confucius_institutes, :through => :countries, :source => :confucius_institutes
end
