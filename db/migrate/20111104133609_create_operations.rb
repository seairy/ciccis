class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.references :user, :null => false
      t.references :conventioner, :null => false
      t.integer :action, :limit => 1, :null => false
      t.timestamps
    end
  end
end
