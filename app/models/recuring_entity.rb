class RecuringEntity < ApplicationRecord
  belongs_to :entity
  validates :entity_id, uniqueness: true
end
