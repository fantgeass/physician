class PrescriptionsController < ApplicationController

  def create
    prescription = Prescription.new(prescription_params)

    if prescription.save
      render jsonapi: prescription, include: [:prescription_ingredients], status: :created
    else
      render jsonapi_errors: prescription.errors, status: :unprocessable_entity
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:name, :address, :date_of_birth, :formulation_id,
                                         prescription_ingredients_attributes: [:ingredient_id, :percentage])
  end

end
