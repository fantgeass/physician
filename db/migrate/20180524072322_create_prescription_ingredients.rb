class CreatePrescriptionIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :prescription_ingredients do |t|
      t.belongs_to :prescription, null: false, index: true
      t.belongs_to :ingredient, null: false, index: true
      t.float :percentage

      t.timestamps
    end
  end
end
