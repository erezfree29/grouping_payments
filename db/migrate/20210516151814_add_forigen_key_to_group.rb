class AddForigenKeyToGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :groups, :author, references: :users, foreign_key: {to_table: :users}
  end
end
