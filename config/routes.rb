Inteligencia::Application.routes.draw do
  resources :gas_stations
  
  root :to => "dashboard#index" 
end
