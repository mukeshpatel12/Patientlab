class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :id_number
      t.string :patient_name
      t.string :gender
      t.integer :date_of_birth
      t.string :first_name
      t.string :last_name
      t.string :phone_mobile

      t.timestamps
    end
  end
end
