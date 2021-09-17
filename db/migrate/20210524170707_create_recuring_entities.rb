class CreateRecuringEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :recuring_entities do |t|

      t.timestamps
    end
  end
end
