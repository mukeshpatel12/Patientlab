class CreatePatientLabs < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_labs do |t|
      t.string :code
      t.string :name
      t.string :value
      t.string :unit
      t.string :ref_range
      t.string :finding
      t.string :result_state

      t.timestamps
    end
  end
end
