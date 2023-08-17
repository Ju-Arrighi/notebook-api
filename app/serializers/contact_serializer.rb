class ContactSerializer < ActiveModel::Serializer
  attributes :id, :email, :birthdate

  belongs_to :kind
  has_many :phones
  has_one :address
end
