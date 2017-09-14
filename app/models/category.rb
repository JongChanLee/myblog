class Category < ApplicationRecord
  before_save :set_depth

  has_many :posts
  has_many :child_categories, class_name: 'Category', foreign_key: :parent_category_id, dependent: :destroy
  belongs_to :parent_category, class_name: 'Category', optional: true


  # def set_top_false
  #   unless self.parent_category_id.nil?
  #     self.top = false
  #   end
  # end
  def set_depth
    if self.parent_category.nil?
      self.depth = 1
    else
      self.depth = self.parent_category.depth + 1
    end
  end
end
