class AddUsersForigenKeyToEntities < ActiveRecord::Migration[6.1]
  def change
    add_reference :entities, :author, references: :users, foreign_key: {to_table: :users}
  end
end
