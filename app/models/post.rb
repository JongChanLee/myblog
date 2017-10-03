class Post < ApplicationRecord
  # after_save :set_imgs

  belongs_to :user
  belongs_to :category, optional: true, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :tinymce_images, dependent: :destroy
  has_and_belongs_to_many :tags

  attr_reader :tag_tokens

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end


  private
  # def set_imgs
  #   # TODO: post가 저장이 된다음에는 image들을 쫙 훌터서 post와 tinymce_image의 관계를 설정해줘야한다. S3에 들어간 url과 post.content의 모든 img를 비교해서 연결해주면 될듯
  # end

end
