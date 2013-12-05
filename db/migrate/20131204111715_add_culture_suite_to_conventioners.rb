class AddCultureSuiteToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :culture_suite_required, :boolean, :after => :collection_taken
    add_column :conventioners, :culture_suite_type, :string, :limit => 20, :after => :culture_suite_required
    add_column :conventioners, :culture_suite_taken, :boolean, :after => :culture_suite_type
  end
end
