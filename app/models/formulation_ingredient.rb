class FormulationIngredient < ApplicationRecord
  belongs_to :formulation
  belongs_to :ingredient

  delegate :name, :description, :classes, to: :ingredient
end
