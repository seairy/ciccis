class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :conventioner, :null => false
      t.references :title, :null => false
      t.timestamps
    end
  end
end
