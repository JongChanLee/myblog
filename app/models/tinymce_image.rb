class TinymceImage < ApplicationRecord
  mount_uploader :file, TinymceImageUploader

  # belongs_to :post
  # 저장을 해보면 content_type 컬럼에는 PublishedPost나 UnpublishedPost가 아닌 Post가 들어간다.
  # 아마도 이 두개가 Post를 상속받고 있기 때문에 실제로 테이블은 post 하나라서 그런 것 같다.
  # 그렇다면 관계설정을 이 두개가 아닌 Post와 TinymceImage 사이에 하면 어떻게 될까?
  # 현재 위의 사항을 반영하여 수정한 것임.
end
