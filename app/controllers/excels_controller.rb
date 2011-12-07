# -*- encoding : utf-8 -*-p
class ExcelsController < ApplicationController
  respond_to :xls
  
  def all_confucius_institutes
    @confucius_institutes = ConfuciusInstitute.all
    respond_with @confucius_institutes
  end
end

