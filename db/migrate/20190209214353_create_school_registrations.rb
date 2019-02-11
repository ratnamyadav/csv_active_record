class CreateSchoolRegistrations < ActiveRecord::Migration
  def change
    create_table :school_registrations do |t|
      t.string :school
      t.boolean :english
      t.boolean :geography
      t.boolean :spanish

      t.timestamps null: false
    end
  end
end
