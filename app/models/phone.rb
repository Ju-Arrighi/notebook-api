class Phone < ApplicationRecord
  belongs_to :contact
  accepts_nested_attributes_for :phone
end
