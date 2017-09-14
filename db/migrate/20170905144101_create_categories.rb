class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_category_id
      t.integer :depth

      t.timestamps
    end

    add_column :posts, :category_id, :integer
  end
end
