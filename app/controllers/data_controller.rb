# -*- encoding : utf-8 -*-p
class DataController < ApplicationController
  
  def analyze_uncascaded
    @valid_country_count = 0
    @invalid_country_count = 0
    @valid_ci_count = 0
    @invalid_ci_count = 0
    @valid_hotel_count = 0
    @invalid_hotel_count = 0
    @titles = []
    Conventioner.all.each do |c|
      unless c.tmp_country.nil?
        Country.where(:name => c.tmp_country).first.blank? ? @invalid_country_count += 1 : @valid_country_count += 1
      end
      unless c.tmp_confucius_institute.blank?
        (!c.tmp_confucius_institute.blank? and ConfuciusInstitute.where(:name => c.tmp_confucius_institute).first.blank?) ? @invalid_ci_count += 1 : @valid_ci_count += 1
      end
      c.tmp_titles.split('，').each{|t| @titles << t unless t.blank?} unless c.tmp_titles.nil?
      if !c.tmp_hotel.nil? and !c.tmp_room.nil?
        unless c.tmp_hotel.blank?
          hotel = Hotel.where(:name => c.tmp_hotel).first
          if hotel.blank?
            @invalid_hotel_count += 1
          else
            hotel.rooms.where(:name => c.tmp_room).first.blank? ? @invalid_hotel_count += 1 : @valid_hotel_count += 1
          end
        end
      end
    end
    @titles.uniq!
  end
  
  def analyze_duplicated_name
    @chinese_names = []
    @foreign_names = []
    @conventioners = []
    Conventioner.all.each do |c|
      if @chinese_names.include?(c.chinese_name.strip)
        @conventioners << Conventioner.where(:chinese_name => c.chinese_name.strip).all
      elsif @foreign_names.include?(c.foreign_name.strip)
        @conventioners << Conventioner.where(:foreign_name => c.foreign_name.strip).all
      end
      @chinese_names << c.chinese_name.strip unless c.chinese_name.strip.blank?
      @foreign_names << c.foreign_name.strip unless c.foreign_name.strip.blank?
    end
    @conventioners.flatten!
  end
  
  def cascade_country
    Conventioner.all.each do |c|
      unless c.tmp_country.blank?
        country = Country.where(:name => c.tmp_country).first
        unless country.blank?
          c.country_id = country.id
          c.tmp_country = nil
          c.save
        end
      end
    end
    redirect_to analyze_uncascaded_data_path, :notice => '操作完成'
  end
  
  def cascade_confucius_institute
    Conventioner.all.each do |c|
      unless c.tmp_confucius_institute.blank?
        confucius_institute = ConfuciusInstitute.where(:name => c.tmp_confucius_institute).first
        c.confucius_institute_id = confucius_institute.id
        c.tmp_confucius_institute = nil
        c.save
      end
    end
    redirect_to analyze_uncascaded_data_path, :notice => '操作完成'
  end
  
  def cascade_title
    Conventioner.all.each do |c|
      title_names = c.tmp_titles.split('，')
      title_names.each do |n|
        title = Title.where(:name => n).first || Title.create({ :name => n })
        Identity.create({ :conventioner_id => c.id, :title_id => title.id })
      end
      c.tmp_titles = nil
      c.save
    end
    redirect_to analyze_uncascaded_data_path, :notice => '操作完成'
  end
  
  def cascade_hotel
    Conventioner.all.each do |c|
      if !c.tmp_hotel.blank? and !c.tmp_room.blank?
        hotel = Hotel.where(:name => c.tmp_hotel).first
        unless hotel.blank?
          room = hotel.rooms.where(:name => c.tmp_room).first
          unless room.blank?
            c.room_id = room.id
            c.tmp_hotel = nil
            c.tmp_room = nil
            c.save
          end
        end
      end
    end
    redirect_to analyze_uncascaded_data_path, :notice => '操作完成'
  end
  
  def invalid_country
    @conventioners = []
    Conventioner.all.each do |c|
      @conventioners << c if Country.where(:name => c.tmp_country).first.blank? and !c.tmp_country.nil?
    end
  end
  
  def invalid_confucius_institute
    @conventioners = []
    Conventioner.order('tmp_confucius_institute ASC').all.each do |c|
      @conventioners << c if !c.tmp_confucius_institute.blank? and ConfuciusInstitute.where(:name => c.tmp_confucius_institute).first.blank?
    end
  end
  
  def invalid_hotel
    @conventioners = []
    Conventioner.all.each do |c|
      unless c.tmp_hotel.blank?
        hotel = Hotel.where(:name => c.tmp_hotel).first
        if hotel.blank?
          @conventioners << c
        else
          @conventioners << c if hotel.rooms.where(:name => c.tmp_room).first.blank?
        end
      end
    end
  end
  
  def analyze_collection_required
    unless params[:names].blank?
      @valid_names = []
      @invalid_names = []
      params[:names].each_line do |names|
        chinese_and_foreign_name = names.split('，')
        (Conventioner.where(:chinese_name => chinese_and_foreign_name[0].strip).first.blank? and Conventioner.where(:foreign_name => chinese_and_foreign_name[1].strip).first.blank?) ? (@invalid_names << names) : (@valid_names << names)
      end
    end
  end
  
  def batch_update_uncascaded_confucius_institute
    unless params[:origin_ci_name].blank?
      Conventioner.where('tmp_confucius_institute LIKE ?', "%#{params[:origin_ci_name]}%").update_all(:tmp_confucius_institute => params[:new_ci_name])
      flash[:notice] = '更新完成'
    end
  end
end

