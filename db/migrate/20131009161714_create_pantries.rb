class CreatePantries < ActiveRecord::Migration
  def change
    create_table :pantries do |t|
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
