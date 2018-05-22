require 'csv'
require 'json'

ingredients_csv = Rails.root.join('db/seeds_data/ingredients.csv')
formulations_csv = Rails.root.join('db/seeds_data/formulations.csv')
formulation_ingredients_csv = Rails.root.join('db/seeds_data/formulation_ingredients.csv')


ingredients = []
CSV.foreach(ingredients_csv, headers: true) do |row|
  ingredients << {
    id: row['id'].to_i,
    name: row['name'],
    min_percentage: row['minimum_percentage'].to_f,
    max_percentage: row['maximum_percentage'].to_f,
    description: row['description'],
    classes: JSON.parse(row['classes'])
  }
end

formulations = []
CSV.foreach(formulations_csv, headers: true) do |row|
  formulations << {
    id: row['id'].to_i,
    name: row['name']
  }
end

formulation_ingredients = []
CSV.foreach(formulation_ingredients_csv, headers: true) do |row|
  formulation_ingredients << {
    formulation_id: row['formulation_id'].to_i,
    ingredient_id: row['ingredient_id'].to_i,
    percentage: row['percentage'].to_f
  }
end


Ingredient.bulk_insert(values: ingredients)
Formulation.bulk_insert(values: formulations)
FormulationIngredient.bulk_insert(values: formulation_ingredients)
