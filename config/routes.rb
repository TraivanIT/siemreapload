Rails.application.routes.draw do

  
  
#for front-end routes
  root to: 'posts#index'
  resources :posts, only: [:index, :show]
  resources :messages, only: [:new, :create] 


#this is CKeditor upload image sytax 
  mount Ckeditor::Engine => '/ckeditor'
#these are admin routes
  get '/login', to: 'admin/sessions#new'
  get '/logout', to: 'admin/sessions#destroy'
  namespace :admin do 
  	resources :traivans, only: [:index, :edit , :update]
  	resources :sessions, only: [:new, :create, :destroy]
    resources :posts
    resources :tags, except: [:index]
    resources :comments, only: [:index ,:update, :destroy]
    resources :visitors, only: [:index, :destroy]
    resources :messages, only: [:index, :show, :update, :destroy]
    resources :notifications, only: [:index, :destroy]
    resources :dashboards, only: [:index]
    resources :settings, only: [:new, :create, :edit, :update]
  end 
  match 'dismiss_all_notifications', to: 'admin/notifications#delete_all', via: :delete
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
