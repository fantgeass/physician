class PrescriptionIngredient < ApplicationRecord
  belongs_to :prescription
  belongs_to :ingredient

  delegate :name, :description, :classes, to: :ingredient

  validates :percentage, presence: true
end
