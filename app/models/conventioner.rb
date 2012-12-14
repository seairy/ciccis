class Conventioner < ActiveRecord::Base
  FROM_DOMESTIC, FROM_FOREIGN, FROM_CONSULATE = 1, 2, 3
  belongs_to :country
  belongs_to :room
  has_many :operations, :dependent => :destroy
  has_many :identities, :dependent => :destroy
  has_many :titles, :through => :identities, :source => :title
  scope :ordered, order(:country_id).order(:foreign_name).order(:chinese_name)
  scope :domestic, where(:from => FROM_DOMESTIC)
  scope :foreign, where(:from => FROM_FOREIGN)
  scope :consulate, where(:from => FROM_CONSULATE)
  scope :voting, where(:nonvoting => false)
  scope :nonvoting, where(:nonvoting => true)
  scope :registered, where('registered_at IS NOT NULL')
  scope :unregistered, where('registered_at IS NULL')
  scope :unoccupied, where('room_id IS NULL')
  scope :collection_required, where(:collection_required => true).includes(:room).order('rooms.hotel_id ASC').includes(:country).order('countries.continent_id ASC').order(:country_id)
  scope :collection_taken, where(:collection_taken => true)
  scope :collection_untaken, where(:collection_taken => false)
  scope :attend_opening, where(:attend_opening => true)
  scope :unattend_opening, where(:attend_opening => false)
  scope :unsure_attend_opening, registered.where(:attend_opening => nil)
  scope :attend_show, where(:attend_show => true)
  scope :unattend_show, where(:attend_show => false)
  scope :unsure_attend_show, registered.where(:attend_show => nil)
  scope :attend_explanation, where(:attend_explanation => true)
  scope :unattend_explanation, where(:attend_explanation => false)
  scope :unsure_attend_explanation, registered.where(:attend_explanation => nil)
  scope :attend_banquet, where(:attend_banquet => true)
  scope :unattend_banquet, where(:attend_banquet => false)
  scope :unsure_attend_banquet, registered.where(:attend_banquet => nil)
  scope :attend_closing, where(:attend_closing => true)
  scope :unattend_closing, where(:attend_closing => false)
  scope :unsure_attend_closing, registered.where(:attend_closing => nil)
  scope :opening_a_class, where(:opening_seat => 'A')
  scope :opening_b_class, where(:opening_seat => 'B')
  scope :opening_c_class, where(:opening_seat => 'C')
  scope :opening_d_class, where(:opening_seat => 'D')
  scope :opening_e_class, where(:opening_seat => 'E')
  scope :opening_f_class, where(:opening_seat => 'F')
  scope :have_opening_seat, where('opening_seat <> \'\'')
  scope :show_a_class, where(:show_seat => 'A')
  scope :show_b_class, where(:show_seat => 'B')
  scope :show_c_class, where(:show_seat => 'C')
  scope :show_d_class, where(:show_seat => 'D')
  scope :have_show_seat, where('show_seat <> \'\'')
  
  def registered?
    !registered_at.blank?
  end
  
  def registered_by
    operations.where(action:Operation::ACTION_REGISTER).first.user.name
  end
  
  def occupied?
    !room.blank?
  end
  
  def human_name
    if chinese_name.blank?
      foreign_name
    else
      if foreign_name.blank?
        chinese_name
      else
        "#{chinese_name}(#{foreign_name})"
      end
    end
  end
  
  class << self
    def search keyword
      conventioner_ids = Country.named(keyword).inject([]){|a, c| a << c.conventioners.collect{|co| co.id}}
      conventioner_ids << ConfuciusInstitute.named(keyword).inject([]){|a, c| a << c.conventioners.collect{|co| co.id}}
      conventioner_ids << where('chinese_name LIKE ? OR foreign_name LIKE ? OR confucius_institute LIKE ? OR work_unit LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%").all.collect{|c| c.id}
      where(id:conventioner_ids.flatten.compact.uniq)
    end
  end
end
