class Prescription < ApplicationRecord
  belongs_to :formulation
  has_many :prescription_ingredients

  accepts_nested_attributes_for :prescription_ingredients

  has_one_attached :pdf

  delegate :name, to: :formulation, prefix: true

  validates :formulation, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :date_of_birth, presence: true
end
