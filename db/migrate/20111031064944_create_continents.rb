class CreateContinents < ActiveRecord::Migration
  def change
    create_table :continents do |t|
      t.string :name, :limit => 50, :null => false
      t.timestamps
    end
  end
end
