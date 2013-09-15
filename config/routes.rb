Inteligencia::Application.routes.draw do
  resources :locations
  resources :gas_stations  
  root :to => "dashboard#index" 
end
