module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :email, :birthdate

    belongs_to :kind
    has_many :phones
    has_one :address

    belongs_to :kind do
      link(:related) { v1_contact_kind_path(object.id) }
    end

    has_many :phones do
      link(:related) { v1_contact_phones_url(object.id) }
    end

    has_one :address do
      link(:related) { v1_contact_address_url(object.id) }
    end
    # link(:self) { v1_contact_path(object.id) }
    # link(:kind) { v1_kind_url(object.kind.id) }

    # def attributes(*args)
    #   h = super(*args)
    #   h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    #   # pt-BR ---> h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    # end

    meta do
      { author: 'Juliana Arrighi'}
    end
  end
end
