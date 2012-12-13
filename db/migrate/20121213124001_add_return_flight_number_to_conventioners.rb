class AddReturnFlightNumberToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :return_flight_number, :string, :limit => 100, :after => :flight_number
  end
end
