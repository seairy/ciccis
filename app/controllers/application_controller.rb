class ApplicationController < ActionController::Base
  before_filter :authorize
  
  protected
  def user_id_in_session
    session[:user_id]
  end
  
  def user_role_in_session
    session[:user_role]
  end
  
  def signined?
    !session[:user_id].blank?
  end
  
  def authorize
    unless signined?
      redirect_to signin_path
    end
  end
end
