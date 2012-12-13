class AddFreeToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :free, :boolean, :after => :position_in_ci
  end
end
