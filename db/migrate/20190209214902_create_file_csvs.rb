class CreateFileCsvs < ActiveRecord::Migration
  def change
    create_table :file_csvs do |t|

      t.timestamps null: false
    end

    add_attachment :file_csvs, :school_registrations_csv
    add_attachment :file_csvs, :users_csv
  end
end
