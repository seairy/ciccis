# -*- encoding : utf-8 -*-p
class ExcelsController < ApplicationController
  respond_to :xls
  
  def all_conventioners
    @hotels = Hotel.all
    @chummage_conventioners = Conventioner.chummage
    @unoccupied_conventioners = Conventioner.unoccupied
  end
end

