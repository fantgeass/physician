class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.string :address
      t.date :date_of_birth
      t.jsonb :formulation_data

      t.timestamps
    end
  end
end
