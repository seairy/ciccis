class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name, :limit => 200, :null => false
      t.timestamps
    end
  end
end
