class PublishedPost < Post
  has_many :tinymce_images, dependent: :destroy, as: :content
end
