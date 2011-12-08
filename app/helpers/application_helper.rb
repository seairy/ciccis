# -*- encoding : utf-8 -*-
module ApplicationHelper
  
  def odevity_tag index
    (index + 1) % 2 == 0 ? 'even' : 'odd'
  end

  def empty_record_tag
    "<tr><td colspan=\"10\" class=\"empty\">没有任何记录！</td></tr>"
  end
  
  def crud_for_list_tag record, options = {}
    crud_actions = []
    crud_actions << "#{image_tag 'ico_show.png', :alt => '查看'} #{link_to '查看', (options[:show_path] || record)}" unless options[:discard_show]
    crud_actions << "#{image_tag 'ico_edit.png', :alt => '编辑'} #{link_to '编辑', (options[:edit_path] || url_for(record) + '/edit')}" unless options[:discard_edit]
    crud_actions << "#{image_tag 'ico_destroy.png', :alt => '删除'} #{link_to '删除', (options[:destroy_path] || record), :confirm => '确定删除该记录？', :method => :delete}" if !options[:discard_destroy]
    crud_actions.join ' | '
  end

  def crud_for_show_tag record, options = {}
    crud_actions = []
    crud_actions << "#{link_to '编辑', (options[:edit_path] || url_for(record) + '/edit'), :class => 'button'}" unless options[:discard_edit]
    crud_actions << "#{link_to '删除', (options[:destroy_path] || record), :class => 'button', :confirm => '确定删除该记录？', :method => :delete}" if !options[:discard_destroy]
    crud_actions << "#{link_to '返回', (options[:return_path] || record.class.new), :class => 'button'}" unless options[:discard_return]
    crud_actions.join ' '
  end
  
  def user_id_in_session
    session[:user_id]
  end
  
  def user_name_in_session
    session[:user_name]
  end
  
  def user_role_in_session
    session[:user_role]
  end
  
  def signined?
    !user_id_in_session.blank?
  end
  
  def flash_tag
    if flash[:alert]
      content_tag 'p', h(flash[:alert]), :class => 'notice alert'
    elsif flash[:notice]
      content_tag 'p', h(flash[:notice]), :class => 'notice'
    end
  end
  
  def options_for_scale
    [['孔子学院', ConfuciusInstitute::SCALE_INSTITUTE], ['孔子课堂', ConfuciusInstitute::SCALE_CLASSROOM]]
  end
  
  def options_for_user_role options = {}
    user_role_options = {}
    user_role_options.merge!({ '管理员' => User::ROLE_ADMIN }) if [User::ROLE_ADMIN].include? user_role_in_session
    user_role_options.merge!({ '汉办领导' => User::ROLE_LEADER }) if [User::ROLE_ADMIN].include? user_role_in_session
    user_role_options.merge!({ '汉办员工' => User::ROLE_EMPLOYEE }) if [User::ROLE_ADMIN, User::ROLE_LEADER].include? user_role_in_session
    user_role_options.merge!({ '志愿者' => User::ROLE_VOLUNTEER }) if [User::ROLE_ADMIN, User::ROLE_LEADER, User::ROLE_EMPLOYEE].include? user_role_in_session
    options_for_select user_role_options, options
  end
  
  def human_boolean_for boolean
    boolean ? '是' : '否'
  end
  
  def human_required_for required
    required ? '需要' : '不需要'
  end
  
  def human_date_for date
    date.strftime '%Y-%m-%d' unless date.blank?
  end
  
  def human_datetime_for datetime
    datetime.strftime '%Y-%m-%d %H:%M' unless datetime.blank?
  end
  
  def human_text_for text
    RedCloth.new(text).to_html unless text.blank?
  end
  
  def human_from_for from
    case from
    when Conventioner::FROM_DOMESTIC then '国内代表'
    when Conventioner::FROM_FOREIGN then '国外代表'
    when Conventioner::FROM_CONSULATE then '使领馆代表'
    end
  end
  
  def human_confucius_institute_for confucius_institute
    confucius_institute.blank? ? '不属于任何孔院' : confucius_institute.name
  end
  
  def human_hotel_for conventioner
    conventioner.room.blank? ? '不需要住宿' : "#{conventioner.room.hotel.name}"
  end
  
  def human_hotel_and_room_for conventioner
    conventioner.room.blank? ? '不需要住宿' : "#{conventioner.room.hotel.name}，#{conventioner.room.name}"
  end
  
  def human_register_for registered_at
    raw registered_at.blank? ? '<span class="cred">未签到</span>' : human_datetime_for(registered_at)
  end
  
  def human_scale_for scale
    case scale
    when 1 then '孔子学院'
    when 2 then '孔子课堂'
    end
  end
  
  def human_user_role_for user_role
    case user_role
    when User::ROLE_ADMIN then '管理员'
    when User::ROLE_LEADER then '汉办领导'
    when User::ROLE_EMPLOYEE then '汉办员工'
    when User::ROLE_VOLUNTEER then '志愿者'
    end
  end
  
  def human_identities_for conventioner
    Title.all.map{ |t| (conventioner.identities.where(title_id:t.id).first.blank? ? check_box_tag('title_ids[]', t.id) : check_box_tag('title_ids[]', t.id, :checked => true)) + t.name }.join ' / '
  end
  
  def human_nonvoting_for nonvoting
    nonvoting ? '列席代表' : '普通代表'
  end
  
  def all_continents
    Continent.all
  end
  
  def all_hotels
    Hotel.all
  end
end

