class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.belongs_to :formulation, null: false, index: true
      t.string :name
      t.string :address
      t.date :date_of_birth

      t.timestamps
    end
  end
end
