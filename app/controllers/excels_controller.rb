# -*- encoding : utf-8 -*-p
class ExcelsController < ApplicationController
  respond_to :xls
  
  def all_conventioners
    @hotels = Hotel.all
    @unoccupied_conventioners = Conventioner.unoccupied
  end
end

