Rails.application.routes.draw do
  root "main#index"
  #get "about", to:"about#index"
  get "about-us", to:"about#index", as: :about    #this means we can change URL but keep the same name we have on link_to

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
