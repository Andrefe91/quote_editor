class LineItemDate < ApplicationRecord
  belongs_to :quote

  # The uniqueness is scoped, meaning that is enforced in the context of the same quote_id
  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :asc) }
end
