module V2
  class PhoneSerializer < ActiveModel::Serializer
    attributes :id, :number

    belongs_to :contact do
      link(:related) { v2_contact_phones_path(object.contact.id) }
    end
  end
end
