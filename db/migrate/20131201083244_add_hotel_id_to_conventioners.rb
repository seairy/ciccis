class AddHotelIdToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :hotel_id, :integer, :after => :room_id
  end
end
