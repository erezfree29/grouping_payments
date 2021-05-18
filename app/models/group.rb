class Group < ApplicationRecord
  # associations
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  mount_uploader :icon, IconUploader
end
