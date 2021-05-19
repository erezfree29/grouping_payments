class Entity < ApplicationRecord
  belongs_to :group, optional: true
  validates :name, :amount, presence: true
  validates :amount, exclusion: { in: [0] , :message => "is not valid"}
end
