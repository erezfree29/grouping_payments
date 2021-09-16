class AddFieldsToEntity < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :external, :boolean
    add_column :entities, :external_group_name, :string
  end
end
