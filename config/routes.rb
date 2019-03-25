Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    #users
    get "/users/me" => "users#show"
    post "/users" => "users#create"
    patch "/users/me" => "users#update"
    delete "/users/me" => "users#destroy"
    post "/sessions" => "sessions#create"
    #pets
    get "/pets" => "pets#index"
    get "/pets/:id" => "pets#show"
    #favorites
    post "/favorites" => "favorites#create"
    delete "/favorites/:id" => "favorites#destroy"
  end



  get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] } 


end
