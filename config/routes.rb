Rails.application.routes.draw do
  root "main#index"
  #get "about", to:"about#index"
  get "about-us", to:"about#index", as: :about    #this means we can change URL but keep the same name we have on link_to
 
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"
  
  get "sign-up", to: "registeration#new"
  post "sign-up", to:"registeration#create"

  get "sign-in", to: "sessions#new"
  post "sign-in", to:"sessions#create"
  #Layout: 
  # get  "what appears in URL", 
  # to: "(controller file and the views folder that need to be created)#(the function inside the Controller class and the html.erb file created in the views folder)"
  delete "logout", to: "sessions#destroy"
  
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
