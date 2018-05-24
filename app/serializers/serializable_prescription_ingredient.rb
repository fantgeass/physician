class SerializablePrescriptionIngredient < JSONAPI::Serializable::Resource
  type 'prescription ingredients'

  attributes :name, :description, :classes, :percentage
end
