class AddPaymentToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :payment, :string, :limit => 500, :after => :room_requirement
  end
end
