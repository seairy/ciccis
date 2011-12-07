class CreateConventioners < ActiveRecord::Migration
  def change
    create_table :conventioners do |t|
      t.string :chinese_name, :limit => 200
      t.string :foreign_name, :limit => 200
      t.references :country
      t.references :confucius_institute
      t.string :work_unit, :position_in_wn, :position_in_ci, :email, :limit => 500
      t.integer :from, :limit => 1
      t.boolean :nonvoting, :smoking
      t.datetime :registered_at
      t.references :room
      t.string :room_number, :limit => 20
      t.datetime :arrived_at, :occupied_at, :departed_at, :returned_at
      t.string :flight_number, :limit => 100
      t.integer :planed_tour_place, :tour_place
      t.boolean :stuff_required, :stuff_taken, :dvd_required, :dvd_taken, :collection_required, :collection_taken
      t.boolean :attend_opening, :attend_banquet, :attend_explanation, :attend_closing
      t.string :person_in_charge
      t.text :remark
      t.timestamps
    end
  end
end
