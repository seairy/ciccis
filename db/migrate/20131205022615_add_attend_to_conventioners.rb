class AddAttendToConventioners < ActiveRecord::Migration
  def change
    add_column :conventioners, :attend_consultation, :boolean, :after => :culture_suite_taken
    add_column :conventioners, :attend_testcase, :boolean, :after => :attend_show
    add_column :conventioners, :attend_president, :boolean, :after => :attend_banquet
  end
end
