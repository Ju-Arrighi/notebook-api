class Contact < ApplicationRecord
  belongs_to :kind
  def author
    'Juliana Arrighi'
  end

  def as_json(options = {})
    super(
      methods: :author,
      root: true,
      include: { kind: { only: :description } }
    )
  end
end
