Rails.application.routes.draw do
  get 'rails_api_controller_time' => 'rails_api#index'
  get 'regular_rails_controller_time' => 'regular_rails#index'

  mount TimeTravel::Engine => "/time_travel"
end
