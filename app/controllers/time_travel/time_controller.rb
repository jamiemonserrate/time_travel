module TimeTravel
  class TimeController < ApplicationController
    def index
      render text: Time.now
    end
  end
end