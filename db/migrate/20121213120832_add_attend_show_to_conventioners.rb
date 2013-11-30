class AddAttendShowToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :attend_show, :boolean, :after => :attend_opening
  end
end
