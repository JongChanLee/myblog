class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

# TODO: 태그 모델을 추가하고, 게시글 마다 태그를 달 수 있는 것을 추가한다. 그 다음에는 태그를 이용해서 META 태그를 생성한다.