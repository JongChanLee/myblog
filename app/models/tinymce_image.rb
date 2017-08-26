class TinymceImage < ApplicationRecord
  mount_uploader :file, TinymceImageUploader

  belongs_to :post
end
