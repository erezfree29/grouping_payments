class AddPhotoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :photo, :string
    add_column :groups, :icon, :string
  end
end
