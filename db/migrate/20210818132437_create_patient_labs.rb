class CreatePatientLabs < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_labs do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.string :value
      t.string :unit
      t.string :ref_range
      t.string :finding
      t.string :result_state
      t.string :date_of_test
      t.string :lab_number
      t.string :clinic_code

      t.timestamps
    end
  end
end
