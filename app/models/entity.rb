class Entity < ApplicationRecord
  belongs_to :created_entities
  belongs_to :group, optional: true
  has_one :recuring_entity
  validates :name, :amount, :occured, :author_id, presence: true
  validates :external_group_name, presence: true, if: -> { external == true }
  validates :amount, exclusion: { in: [0], message: 'is not valid' }
end
