class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :element_id
      t.string :element_type
      t.timestamps
    end
  end
end
