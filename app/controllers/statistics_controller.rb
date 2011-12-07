# -*- encoding : utf-8 -*-p
class StatisticsController < ApplicationController
  
  def register
    @total_conventioners_count = Conventioner.all.size
    @registered_conventioners_count = Conventioner.registered.size
    @unregistered_conventioners_count = Conventioner.unregistered.size
  end
  
  def occupation
    @hotels = Hotel.all
  end
end

