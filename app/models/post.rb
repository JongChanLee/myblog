class Post < ApplicationRecord
  # before_save :delete_ready_post,
  #             if: Proc.new { |post| post.state == 'unpublished' && Post.where(state: 0).count >= 1}

  belongs_to :user
  # has_many :tinymce_images, dependent: :destroy

  # enum state: [:unpublished, :published]

  # def delete_ready_post
  #   Post.where(state: 0).first.destroy
  # end
end
