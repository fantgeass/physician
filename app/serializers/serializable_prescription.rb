class SerializablePrescription < JSONAPI::Serializable::Resource
  type 'prescriptions'

  attributes :name, :address, :date_of_birth, :formulation_name

  has_many :prescription_ingredients
end
