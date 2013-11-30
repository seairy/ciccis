class CreateConfuciusInstitutes < ActiveRecord::Migration
  def change
    create_table :confucius_institutes do |t|
      t.references :country, :null => false
      t.string :name, :limit => 200, :null => false
      t.integer :scale, :limit => 1, :null => false
      t.timestamps
    end
  end
end
