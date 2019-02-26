Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/users/me" => "users#show"
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    get "/pets" => "pets#index"
    get "/pets/:id" => "pets#show"
  end

end
