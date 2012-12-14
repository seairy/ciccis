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
  
  def unoccupied
    @conventioners = Conventioner.unoccupied.ordered.paginate :page => params[:page]
  end
  
  def opening_seats
    if params[:seat_class] == 'A'
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
    elsif params[:seat_class] == 'F'
      if !params[:registered].blank?
        @conventioners = Conventioner.opening_f_class.registered.ordered.paginate :page => params[:page]
      elsif !params[:unregistered].blank?
        @conventioners = Conventioner.opening_f_class.unregistered.ordered.paginate :page => params[:page]
      else
        @conventioners = Conventioner.opening_f_class.ordered.paginate :page => params[:page]
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
end