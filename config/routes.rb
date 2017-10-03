Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'user/sessions',
                 registrations: 'user/registrations'
             }

  root 'main#index'

  resources :tags, only: [:index]
  resource :categories, except: [:index, :new, :show]
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  post '/tinymce_assets' => 'posts#tinymce_img_create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
