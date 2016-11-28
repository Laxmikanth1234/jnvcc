Rails.application.routes.draw do
  resources :testimonials
  resources :events
  resources :comments
  resources :activities do
    resources :comments
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # resources :users

  get 'page/home'

  get 'page/mypage'

  get 'page/members'

  get 'page/activities'

  get 'page/events'

  get 'page/batches'

  get 'page/contact'
  root 'page#home'
  devise_for :users
  resources :users
  # resources :users, only: [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
