class AddCheckInAtToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :check_in_at, :integer, :after => :room_number
  end
end
