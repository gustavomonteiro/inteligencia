Inteligencia::Application.routes.draw do
  resources :postos


  # resources :municipios
  
  root :to => "postos#index" 


end
