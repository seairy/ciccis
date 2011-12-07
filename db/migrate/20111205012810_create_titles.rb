class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :name, :limit => 50, :null => false
      t.timestamps
    end
  end
end
