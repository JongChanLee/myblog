Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'user/sessions',
                 registrations: 'user/registrations'
             }

  root 'main#index'

  resources :posts do
    post '/comments', to: 'posts#create_comment'
    get '/comments/:id/edit', to: 'posts#edit_comment', as: 'edit_comment'
    put '/comments/:id', to: 'posts#update_comment', as: 'comment'
    patch '/comments/:id', to: 'posts#update_comment'
    delete '/comments/:id', to: 'posts#destroy_comment'
  end
  post '/tinymce_assets' => 'posts#tinymce_img_create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
