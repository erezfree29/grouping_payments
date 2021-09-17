class AddDateTimeToEntities < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :occured, :datetime
  end
end
