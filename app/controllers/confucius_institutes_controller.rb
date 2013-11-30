# -*- encoding : utf-8 -*-
class ConfuciusInstitutesController < ApplicationController
  
  def index
    if params[:continent_id].blank?
      @confucius_institutes = ConfuciusInstitute.paginate :page => params[:page]
    else
      @continent = Continent.find(params[:continent_id])
      @confucius_institutes = @continent.confucius_institutes.paginate :page => params[:page]
    end
  end
  
  def show
    @confucius_institute = ConfuciusInstitute.find(params[:id])
  end
  
  def new
    @confucius_institute = ConfuciusInstitute.new
  end
  
  def edit
    @confucius_institute = ConfuciusInstitute.find(params[:id])
  end
  
  def create
    @confucius_institute = ConfuciusInstitute.new(params[:confucius_institute])
    if @confucius_institute.save
      redirect_to(@confucius_institute, :notice => '创建成功')
    else
      render :action => "new"
    end
  end
  
  def update
    @confucius_institute = ConfuciusInstitute.find(params[:id])
    if @confucius_institute.update_attributes(params[:confucius_institute])
      redirect_to(@confucius_institute, :notice => '更新成功')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @confucius_institute = ConfuciusInstitute.find(params[:id])
    @confucius_institute.destroy
    redirect_to(confucius_institutes_url)
  end
  
  def search
    unless params[:keyword].blank?
      @confucius_institutes = ConfuciusInstitute.search(params[:keyword]).paginate :page => params[:page]
      render 'result'
    end
  end
end