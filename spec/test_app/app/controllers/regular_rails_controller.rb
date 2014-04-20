class RegularRailsController < ActionController::Base
  def index
    render text: Time.zone.now
  end
end