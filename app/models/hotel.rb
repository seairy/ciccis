class Hotel < ActiveRecord::Base
  has_many :rooms do
    def total_amount
      all.collect{|r| r.amount}.inject{|sum, a| sum += a} || 0
    end
  end
  has_many :conventioners, :through => :rooms
end
