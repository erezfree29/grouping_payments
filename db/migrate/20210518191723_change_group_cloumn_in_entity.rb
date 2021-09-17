class ChangeGroupCloumnInEntity < ActiveRecord::Migration[6.1]
  def change
    change_column :entities, :group_id, :integer, :null => true
  end
end
