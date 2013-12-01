class AddPhoneToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :phone, :string, :limit => 200, :after => :email
  end
end
