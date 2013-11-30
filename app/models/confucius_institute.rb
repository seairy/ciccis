class ConfuciusInstitute < ActiveRecord::Base
  SCALE_INSTITUTE, SCALE_CLASSROOM = 1, 2
  belongs_to :country
  has_many :conventioners
  scope :named, lambda {|keyword| where('name LIKE ?', "%#{keyword}%").includes(:conventioners)}
  
  class << self
    def search keyword
      where(['name LIKE ?', "%#{keyword}%"])
    end
  end
end
