module V2
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :email, :birthdate

    belongs_to :kind
    has_many :phones
    has_one :address

    belongs_to :kind do
      link(:related) { v2_contact_kind_path(object.id) }
    end

    has_many :phones do
      link(:related) { v2_contact_phones_url(object.id) }
    end

    has_one :address do
      link(:related) { v2_contact_address_url(object.id) }
    end
    # link(:self) { v2_contact_path(object.id) }
    # link(:kind) { v2_kind_url(object.kind.id) }
  end
end
