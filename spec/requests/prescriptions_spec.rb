require 'rails_helper'

RSpec.describe 'Prescriptions' do

  describe '/prescriptions' do
    context 'POST' do
      it '201' do
        formulation = Formulation.first
        params = {
          prescription: {
            name: 'John Smith',
            address: 'Somewhere',
            date_of_birth: Date.yesterday,
            formulation_id: formulation.id,
            prescription_ingredients_attributes:
              formulation.formulation_ingredients.map {|i| {ingredient_id: i.ingredient_id, percentage: i.percentage} }
          }
        }

        post prescriptions_url, params: params.to_json, headers: json_headers

        expect(response).to have_http_status(201)
        # in production scenario we need to check body against json-schema
        expect(json_body[:data][:id].to_i).to be_integer
      end
      it '422' do
        params = {prescription: {name: ''}}

        post prescriptions_url, params: params.to_json, headers: json_headers

        expect(response).to have_http_status(422)
      end
    end
  end
end
