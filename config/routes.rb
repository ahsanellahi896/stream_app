Rails.application.routes.draw do
  get 'channels/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :channels, only: [:show] do
    collection do
      get :all_by_category
    end
  end

  get 'news', to: 'static_pages#news', as: :news
  get 'business', to: 'static_pages#business', as: :business
  get 'sports', to: 'static_pages#sports', as: :sports
  get 'general', to: 'static_pages#general', as: :general

  root 'static_pages#home'
end
