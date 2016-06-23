Rails.application.routes.draw do
  root 'static_pages#home'
  get 'news', to: 'static_pages#news', as: :news
  get 'business', to: 'static_pages#business', as: :business
  get 'sports', to: 'static_pages#sports', as: :sports
  get 'general', to: 'static_pages#general', as: :general

end
