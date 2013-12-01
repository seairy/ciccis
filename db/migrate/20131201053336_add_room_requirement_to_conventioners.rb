class AddRoomRequirementToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :room_requirement, :string, :limit => 500, :after => :room_number
  end
end
