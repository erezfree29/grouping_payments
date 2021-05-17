class AddForiegnKeyToEntities < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :refrences, :groups
  end
end
