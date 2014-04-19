Rails.application.routes.draw do
  get 'rails_api_controller_time' => 'rails_api#index'

  mount TimeTravel::Engine => "/time_travel"
end
