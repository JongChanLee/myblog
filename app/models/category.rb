class Category < ApplicationRecord
  has_many :posts
  has_many :child_categories, class: 'Category', foreign_key: :parent_category_id, dependent: :destroy
  belongs_to :parent_category, class: 'Category', optional: true


end
