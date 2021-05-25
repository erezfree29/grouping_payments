class RecuringEntity < ApplicationRecord
  belongs_to :entity 
  validates :entity_id, uniqueness: true
  validates :entity_id, :repeat, presence: true
  validates :entity_id, uniqueness: true
end
