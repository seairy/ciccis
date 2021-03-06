# -*- encoding : utf-8 -*-
class ConventionersController < ApplicationController
  
  def index
    @conventioners = Conventioner.ordered.paginate :page => params[:page]
  end
  
  def registered
    @conventioners = Conventioner.registered.ordered.paginate :page => params[:page]
  end
  
  def unregistered
    @conventioners = Conventioner.unregistered.ordered.paginate :page => params[:page]
  end
  
  def collection_required
    if !params[:registered].blank?
      @conventioners = Conventioner.collection_required.registered.ordered.paginate :page => params[:page]
    elsif !params[:unregistered].blank?
      @conventioners = Conventioner.collection_required.unregistered.ordered.paginate :page => params[:page]
    elsif !params[:taken].blank?
      @conventioners = Conventioner.collection_required.collection_taken.ordered.paginate :page => params[:page]
    elsif !params[:untaken].blank?
      @conventioners = Conventioner.collection_required.collection_untaken.ordered.paginate :page => params[:page]
    else
      @conventioners = Conventioner.collection_required.ordered.paginate :page => params[:page]
    end
  end
  
  def chummage
    @conventioners = Conventioner.chummage.ordered.paginate :page => params[:page]
  end
  
  def unoccupied
    @conventioners = Conventioner.unoccupied.ordered.paginate :page => params[:page]
  end
  
  def opening_seats
    if params[:seat_class] == 'VIP'
      if !params[:registered].blank?
        @conventioners = Conventioner.opening_vip_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.opening_vip_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.opening_vip_class.ordered.paginate :page => params[:page]
      end
    elsif params[:seat_class] == 'A'
      if !params[:registered].blank?
        @conventioners = Conventioner.opening_a_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.opening_a_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.opening_a_class.ordered.paginate :page => params[:page]
      end
    elsif params[:seat_class] == 'B'
      if !params[:registered].blank?
        @conventioners = Conventioner.opening_b_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.opening_b_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.opening_b_class.ordered.paginate :page => params[:page]
      end
    elsif params[:seat_class] == 'C'
      if !params[:registered].blank?
        @conventioners = Conventioner.opening_c_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.opening_c_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.opening_c_class.ordered.paginate :page => params[:page]
      end
    elsif params[:seat_class] == 'D'
      if !params[:registered].blank?
        @conventioners = Conventioner.opening_d_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.opening_d_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.opening_d_class.ordered.paginate :page => params[:page]
      end
    elsif params[:seat_class] == 'E'
      if !params[:registered].blank?
        @conventioners = Conventioner.opening_e_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.opening_e_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.opening_e_class.ordered.paginate :page => params[:page]
      end
    else
      if !params[:registered].blank?
        @conventioners = Conventioner.have_opening_seat.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.have_opening_seat.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.have_opening_seat.ordered.paginate :page => params[:page]
      end
    end
  end
  
  def show_seats
    if params[:seat_class] == 'A'
      if !params[:registered].blank?
        @conventioners = Conventioner.show_a_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.show_a_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.show_a_class.ordered.paginate :page => params[:page]
      end
    elsif params[:seat_class] == 'B'
      if !params[:registered].blank?
        @conventioners = Conventioner.show_b_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.show_b_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.show_b_class.ordered.paginate :page => params[:page]
      end
    elsif params[:seat_class] == 'C'
      if !params[:registered].blank?
        @conventioners = Conventioner.show_c_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.show_c_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.show_c_class.ordered.paginate :page => params[:page]
      end
    elsif params[:seat_class] == 'D'
      if !params[:registered].blank?
        @conventioners = Conventioner.show_d_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.show_d_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.show_d_class.ordered.paginate :page => params[:page]
      end
    else
      if !params[:registered].blank?
        @conventioners = Conventioner.have_show_seat.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.have_show_seat.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.have_show_seat.ordered.paginate :page => params[:page]
      end
    end
  end
  
  def show
    @conventioner = Conventioner.find(params[:id])
  end
  
  def new
    @conventioner = Conventioner.new
  end
  
  def edit
    @conventioner = Conventioner.find(params[:id])
  end
  
  def create
    @conventioner = Conventioner.new(params[:conventioner])
    if @conventioner.save
      params[:title_ids].each{|title_id| Identity.create({ :conventioner_id => @conventioner.id, :title_id => title_id })} unless params[:title_ids].blank?
      redirect_to(@conventioner, :notice => '创建成功')
    else
      render :action => "new"
    end
  end
  
  def update
    @conventioner = Conventioner.find(params[:id])
    if @conventioner.update_attributes(params[:conventioner])
      @conventioner.identities.destroy_all
      params[:title_ids].each{|title_id| Identity.create({ :conventioner_id => @conventioner.id, :title_id => title_id })} unless params[:title_ids].blank?
      Operation.create({ :user_id => user_id_in_session, :conventioner_id => @conventioner.id, :action => Operation::ACTION_UPDATE })
      redirect_to(@conventioner, :notice => '更新成功')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @conventioner = Conventioner.find(params[:id])
    @conventioner.destroy
    redirect_to conventioners_path
  end
  
  def search
    unless params[:keyword].blank?
      @conventioners = Conventioner.search(params[:keyword]).paginate :page => params[:page]
      render 'result'
    end
  end
  
  def register
    @conventioner = Conventioner.find(params[:id])
    if request.post?
      if @conventioner.registered?
        flash[:alert] = '该参会代表已经进行签到了'
      else
        @conventioner.update_attributes(params[:conventioner])
        @conventioner.update_attribute :registered_at, Time.now
        Operation.create({ :user_id => user_id_in_session, :conventioner_id => @conventioner.id, :action => Operation::ACTION_REGISTER })
        flash[:notice] = '签到成功'
      end
      redirect_to @conventioner
    end
  end
  
  def update_opening_seats
    @error_messages = []
    @unchange_seats = 0
    @changed_seats = 0
    if request.post?
      params[:opening_seats].each_line do |opening_seat|
        array = opening_seat.chop.split('，')
        if array.size != 3
          @error_messages << ["格式错误", "#{opening_seat}"] 
          next
        else
          result = Conventioner.where(chinese_name: array[0]).where(foreign_name: array[1]).all
          if (array[0].blank? and array[1].blank?) or result.size == 0
            @error_messages << ["参会代表不存在", "#{opening_seat}"] 
          elsif result.size > 1
            @error_messages << ["姓名重复", "#{opening_seat}"] 
          elsif result.size == 1
            conventioner = result.first
            if conventioner.opening_seat == array[2]
              @unchange_seats += 1
            else
              conventioner.opening_seat = array[2]
              conventioner.save
              @changed_seats += 1
            end
          end
        end
      end
      render 'update_opening_seats_result'
    end
  end
  
  def update_dvd_informations
    @error_messages = []
    @changed_conventioners = 0
    if request.post?
      params[:dvd_informations].each_line do |dvd_information|
        array = dvd_information.chop.split('，')
        if array.size != 2
          @error_messages << ["格式错误", "[array.size:#{array.size}]#{dvd_information}"] 
          next
        else
          result = Conventioner.where(chinese_name: array[0]).where(foreign_name: array[1]).all
          if (array[0].blank? and array[1].blank?) or result.size == 0
            @error_messages << ["参会代表不存在", "#{dvd_information}"] 
          elsif result.size > 1
            @error_messages << ["姓名重复", "#{dvd_information}"] 
          elsif result.size == 1
            conventioner = result.first
            conventioner.dvd_required = true
            conventioner.dvd_taken = false
            conventioner.save
            @changed_conventioners += 1
          end
        end
      end
      render 'update_dvd_informations_result'
    end
  end
end