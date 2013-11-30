class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account, :limit => 16, :null => false
      t.string :hashed_password, :limit => 32, :null => false
      t.string :name, :limit => 50, :null => false
      t.integer :role, :limit => 1, :null => false
      t.boolean :prohibited, :null => false
      t.datetime :last_signined_at
    end
  end
end
