TimeTravel::Engine.routes.draw do
  resources :time, :only => [:index]
end
