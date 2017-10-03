class MainController < ApplicationController
  def index
    set_meta_tags description: 'Ruby On Rails를 이용해서 개발을 하고 있는 이종찬이라고 합니다.',
                  image_src: ActionController::Base.helpers.asset_url('profile.png', host: root_url),
                  og: {
                      title: 'TuTankhamen\'s blog',
                      type: ['website', 'profile'],
                      url: root_url,
                      image: ActionController::Base.helpers.asset_url('profile.png', host: root_url),
                      description: 'Ruby On Rails를 이용해서 개발을 하고 있는 이종찬이라고 합니다.'
                  },
                  profile: {
                      first_name: 'JongChan',
                      last_name: 'Lee',
                      username: 'TuTanKhamen',
                      gender: 'male'
                  }
  end

end
