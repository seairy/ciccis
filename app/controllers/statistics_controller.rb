# -*- encoding : utf-8 -*-p
class StatisticsController < ApplicationController
  
  def general
    @total_conventioners_count = Conventioner.all.size
    @registered_conventioners_count = Conventioner.registered.size
    @unregistered_conventioners_count = Conventioner.unregistered.size
  end
  
  def occupation
    @hotels = Hotel.all
    @unoccupied_conventioners = Conventioner.unoccupied
  end
  
  def title
    @titles = Title.all
  end
  
  def collection
    @conventioners = Conventioner.collection_required
    @hotels = Hotel.all
  end
end

