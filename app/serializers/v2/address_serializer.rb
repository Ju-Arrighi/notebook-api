module V2
  class AddressSerializer < ActiveModel::Serializer
    attributes :id, :street, :city

    belongs_to :contact do
      link(:related) { v2_contact_address_path(object.contact.id) }
    end
  end
end
