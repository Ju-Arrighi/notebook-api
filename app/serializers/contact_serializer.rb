class ContactSerializer < ActiveModel::Serializer
  attributes :id, :email, :birthdate

  belongs_to :kind
  has_many :phones
  has_one :address

  # def attributes(*args)
  #   h = super(*args)
  #   h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  #   # pt-BR ---> h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
  # end

  meta do
    { author: 'Juliana Arrighi'}
  end
end
