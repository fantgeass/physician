class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :min_percentage
      t.float :max_percentage
      t.text :description
      t.string :classes, array: true

      t.timestamps
    end
    add_index :ingredients, :classes, using: 'gin'
  end
end
