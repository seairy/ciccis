class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.references :continent, :null => false
      t.string :name, :limit => 100, :null => false
      t.timestamps
    end
  end
end
