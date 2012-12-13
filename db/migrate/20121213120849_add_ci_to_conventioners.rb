class AddCiToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :confucius_institute, :string, :limit => 500, :after => :confucius_institute_id
  end
end
