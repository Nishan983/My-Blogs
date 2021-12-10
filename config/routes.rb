Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#index', as: 'blog'
  
  get '/blog/new', to: 'main#new', as: 'new_blog'
  post '/blog/new', to: 'main#create'
  delete '/blog/delete/:id', to: 'main#destroy' , as: 'delete_blog'
  get '/blog/edit/:id', to: 'main#edit' , as: 'edit_blog'
  patch '/blog/edit/:id', to: 'main#update' , as: 'update_blog'

   
end
