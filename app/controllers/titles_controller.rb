# -*- encoding : utf-8 -*-
class TitlesController < ApplicationController
  
  def index
    @titles = Title.paginate :page => params[:page]
  end
  
  def show
    @title = Title.find(params[:id])
    if !params[:registered].blank?
      @conventioners = @title.conventioners.registered
    elsif !params[:unregistered].blank?
      @conventioners = @title.conventioners.unregistered
    else
      @conventioners = @title.conventioners
    end
  end
  
  def new
    @title = Title.new
  end
  
  def edit
    @title = Title.find(params[:id])
  end
  
  def create
    @title = Title.new(params[:title])
    if @title.save
      redirect_to(titles_path, :notice => '创建成功')
    else
      render :action => "new"
    end
  end
  
  def update
    @title = Title.find(params[:id])
    if @title.update_attributes(params[:title])
      redirect_to(titles_path, :notice => '更新成功')
    else
      render :action => "edit"
    end
  end
end