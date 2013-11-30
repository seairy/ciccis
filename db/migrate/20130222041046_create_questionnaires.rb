class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :name, :limit => 200, :null => false
      t.string :mobile, :limit => 200, :null => false
      t.string :phone, :limit => 200
      t.string :email, :limit => 200
      t.string :qq, :limit => 200
      t.string :weibo, :limit => 200
      t.string :weixin, :limit => 200
      t.string :city, :limit => 200, :null => false
      t.string :address, :limit => 500
      t.string :organization, :limit => 200, :null => false
      t.string :title, :limit => 200
      t.boolean :with_spouse, :null => false
      t.boolean :with_child, :null => false
      t.integer :child_amount, :limit => 1
      t.text :will_participate_at, :null => false
      t.text :suggestion
      t.timestamps
    end
  end
end
