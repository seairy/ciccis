# -*- encoding : utf-8 -*-
class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many :conventioners
  
  def available_amount
    amount - booked_amount
  end
  
  def booked_amount
    conventioners.size
  end
  
  def occupied_amount
    conventioners.collect{|c| c.registered_at}.compact.size
  end
  
  def name_with_details
    "#{name}(共#{amount}间/已预订#{booked_amount}间/已入住#{occupied_amount}间)"
  end
end
