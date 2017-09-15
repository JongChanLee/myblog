class AddCounterCacheToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :posts,      :comments_count,    :integer, default: 0
    add_column :categories, :posts_count,       :integer, default: 0
  end
end
