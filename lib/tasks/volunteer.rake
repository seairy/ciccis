# -*- encoding : utf-8 -*-
namespace :db do
  desc 'Create volunteer accounts'
  task :create_volunteer => :environment do
    [['北辰洲际', 'zhouji'], ['马哥孛罗', 'mage'], ['五洲皇冠', 'huangguan'], ['国家会议中心', 'huiyi'], ['中奥凯富', 'kaifu'], ['凯迪克', 'kaidike'], ['喜来登', 'xilaideng'], ['西苑饭店', 'xiyuan']].each do |hotel|
      1.upto(8).each_with_index do |n|
        User.create({ :account => "#{hotel[1]}#{n}", :password => 'hanban1206', :password_confirmation => 'hanban1206', :name => "#{hotel[0]}#{n}", :role => User::ROLE_VOLUNTEER, :prohibited => false })
      end
    end
  end
end