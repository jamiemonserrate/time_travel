TimeTravel::Engine.routes.draw do
  resources :time, :only => [:index]

  get 'time/travel/:day/:month/:year' => 'time#travel'
  get 'time/travel/stop' => 'time#stop'
end
