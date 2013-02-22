# -*- encoding : utf-8 -*-
class QuestionnairesController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  
  def index
    @questionnaires = Questionnaire.paginate :page => params[:page]
  end
  
  def show
    @questionnaire = Questionnaire.find(params[:id])
  end
  
  def new
    @questionnaire = Questionnaire.new
    render :layout => 'questionnaire'
  end
  
  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end
  
  def create
    @questionnaire = Questionnaire.new(params[:questionnaire])
    if @questionnaire.save
      render 'created_success', :layout => 'questionnaire'
    else
      render :action => "new", :layout => 'questionnaire'
    end
  end
  
  def update
    @questionnaire = Questionnaire.find(params[:id])
    if @questionnaire.update_attributes(params[:questionnaire])
      redirect_to(@questionnaire, :notice => '更新成功')
    else
      render :action => "edit"
    end
  end
end