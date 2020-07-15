Rails.application.routes.draw do
  resources :questions do
    collection {post :import}
  end
  resources :roles, only: [:index]
  resources :mappings, only: [:index]
  root to: "questions#import_index"
end
