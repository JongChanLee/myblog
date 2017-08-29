Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'user/sessions',
                 registrations: 'user/registrations'
             }

  root 'main#index'

  resources :posts
  post '/tinymce_assets' => 'posts#tinymce_img_create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
