class AddSeatToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :opening_seat, :string, :limit => 10, :after => :attend_closing
    add_column :conventioners, :show_seat, :string, :limit => 10, :after => :opening_seat
  end
end
