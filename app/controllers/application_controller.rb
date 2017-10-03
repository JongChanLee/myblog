class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_meta

  def set_meta
    set_meta_tags site: 'TuTanKhamen\'s blog',
                  reverse: true,
                  author: 'JongChan Lee',
                  charset: 'utf-8',
                  icon: {
                      href: ActionController::Base.helpers.asset_url('favicon.ico', host: root_url),
                      type: 'image/x-icon',
                      sizes: '16x16'
                  }
  end
end

# TODO: 태그 모델을 추가하고, 게시글 마다 태그를 달 수 있는 것을 추가한다. 그 다음에는 태그를 이용해서 META 태그를 생성한다.