class Conventioner < ActiveRecord::Base
  FROM_DOMESTIC, FROM_FOREIGN, FROM_CONSULATE = 1, 2, 3
  belongs_to :country
  belongs_to :confucius_institute
  belongs_to :room
  has_many :operations, :dependent => :destroy
  has_many :identities, :dependent => :destroy
  has_many :titles, :through => :identities, :source => :title
  scope :registered, where('registered_at IS NOT NULL')
  scope :unregistered, where('registered_at IS NULL')
  
  def registered?
    !registered_at.blank?
  end
  
  def registered_by
    operations.where(action:Operation::ACTION_REGISTER).first.user.name
  end
  
  def occupied?
    !room.blank?
  end
  
  class << self
    def search keyword
      conventioner_ids = Country.named(keyword).inject([]){|a, c| a << c.conventioners.collect{|co| co.id}}
      conventioner_ids << ConfuciusInstitute.named(keyword).inject([]){|a, c| a << c.conventioners.collect{|co| co.id}}
      conventioner_ids << where('chinese_name LIKE ? OR foreign_name LIKE ?', "%#{keyword}%", "%#{keyword}%").all.collect{|c| c.id}
      where(id:conventioner_ids.flatten.compact.uniq)
    end
  end
end
