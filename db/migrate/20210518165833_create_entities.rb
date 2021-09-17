class CreateEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.float :amount
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
