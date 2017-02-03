class CreateObjectNames < ActiveRecord::Migration[5.0]
  def change
    create_table :object_names do |t|

      t.timestamps
    end
  end
end
