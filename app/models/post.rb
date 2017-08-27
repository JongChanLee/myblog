class Post < ApplicationRecord
  # after_save는 update가 된다음에도 실행되는가?
  after_save :set_imgs

  belongs_to :user
  has_many :tinymce_images, dependent: :destroy



  private
  def set_imgs
    logger.info self.title
  end

end
