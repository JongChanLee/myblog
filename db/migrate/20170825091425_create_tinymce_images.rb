class CreateTinymceImages < ActiveRecord::Migration[5.1]
  def change
    create_table :tinymce_images do |t|
      t.string :alt
      t.string :hint
      t.string :file
      t.integer :post_id

      t.timestamps
    end
  end
end
