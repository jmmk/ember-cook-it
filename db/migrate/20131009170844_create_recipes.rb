class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :directions, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
