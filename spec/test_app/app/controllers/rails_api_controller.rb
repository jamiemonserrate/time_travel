class RailsApiController < ActionController::API
  def index
    render text: Time.zone.now
  end
end