class CreateFormulationIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :formulation_ingredients, id: false do |t|
      t.belongs_to :formulation, null: false, index: true
      t.belongs_to :ingredient, null: false, index: true
      t.float :percentage

      t.timestamps
    end
  end
end
