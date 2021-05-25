class AddRepeatToRecuringEntities < ActiveRecord::Migration[6.1]
  def change
    add_column :recuring_entities, :repeat, :string
  end
end
