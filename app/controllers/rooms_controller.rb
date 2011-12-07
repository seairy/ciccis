# -*- encoding : utf-8 -*-
class RoomsController < ApplicationController
  before_filter :find_hotel
  
  def index
    @rooms = Room.paginate :page => params[:page]
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def new
    @room = Room.new
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def create
    @room = Room.new(params[:room])
    @room.hotel = @hotel
    if @room.save
      redirect_to(@hotel, :notice => '创建成功')
    else
      render :action => "new"
    end
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      redirect_to(@hotel, :notice => '更新成功')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to(@hotel)
  end
  
  protected
  def find_hotel
    @hotel = Hotel.find params[:hotel_id]
  end
end