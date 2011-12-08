# -*- encoding : utf-8 -*-
class HotelsController < ApplicationController
  
  def index
    @hotels = Hotel.paginate :page => params[:page]
  end
  
  def show
    @hotel = Hotel.find(params[:id])
  end
  
  def collection_required_conventioners
    @hotel = Hotel.find(params[:id])
    if !params[:taken].blank?
      @conventioners = @hotel.conventioners.collection_required.collection_taken
    elsif !params[:untaken].blank?
      @conventioners = @hotel.conventioners.collection_required.collection_untaken
    else
      @conventioners = @hotel.conventioners.collection_required
    end
  end
  
  def new
    @hotel = Hotel.new
  end
  
  def edit
    @hotel = Hotel.find(params[:id])
  end
  
  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save
      redirect_to(@hotel, :notice => '创建成功')
    else
      render :action => "new"
    end
  end
  
  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update_attributes(params[:hotel])
      redirect_to(@hotel, :notice => '更新成功')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @hotel = Hotel.find(params[:id])
    if @hotel.rooms.size > 0
      redirect_to @hotel, :alert => '删除失败，请先删除该酒店所有房型后重试！'
    else
      @hotel.destroy
      redirect_to hotels_path
    end
  end
end