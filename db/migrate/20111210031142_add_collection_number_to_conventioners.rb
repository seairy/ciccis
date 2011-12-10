class AddCollectionNumberToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :collection_number, :integer, :after => :collection_required
  end
end
