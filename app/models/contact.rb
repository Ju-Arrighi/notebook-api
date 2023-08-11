class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def author
    'Juliana Arrighi'
  end

  # def as_json(options = {})
  #   super(
  #     methods: :author,
  #     root: true,
  #     include: { kind: { only: :description } },
  #     include: :phones
  #   )
  # end

  # def to_pt
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  # end
end
