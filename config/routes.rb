Rails.application.routes.draw do
  

  

 
 

  

 #this is CKeditor upload image sytax 
  mount Ckeditor::Engine => '/ckeditor'
 
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
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
