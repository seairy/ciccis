class Country < ActiveRecord::Base
  belongs_to :continent
  has_many :conventioners
  has_many :confucius_institutes
  scope :named, lambda {|keyword| where('name LIKE ?', "%#{keyword}%").includes(:conventioners)}
end
