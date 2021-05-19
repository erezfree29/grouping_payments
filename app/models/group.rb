class Group < ApplicationRecord
  # associations
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  # validations
  validates :name, :icon, :author_id, presence: true
  validates :name, uniqueness: true
  # picture uploader
  mount_uploader :icon, IconUploader
end
