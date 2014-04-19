Rails.application.routes.draw do

  mount TimeTravel::Engine => "/time_travel"
end
