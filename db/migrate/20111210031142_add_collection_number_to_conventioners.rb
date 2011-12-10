class AddCollectionNumberToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :collection_number, :string, :after => :collection_required
  end
end
