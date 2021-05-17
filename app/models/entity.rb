class Entity < ApplicationRecord
  # associations
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
end
