Rails.application.routes.draw do
  post "/urls", to: "urls#index"
  get "/urls/:short_url", to: "urls#return_url"
  get "/urls/:short_url/stats", to: "urls#stats"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
