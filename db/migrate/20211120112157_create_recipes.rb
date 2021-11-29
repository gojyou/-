class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|

      t.integer :store_id
      t.string :cooking_name
      t.text :recipe
      t.string :amount
      t.string :image_id

      t.timestamps
    end
  end
end
