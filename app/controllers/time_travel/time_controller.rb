module TimeTravel
  class TimeController < ApplicationController
    def index
      render text: Time.zone.now
    end

    def travel
      File.open("#{Rails.root}/tmp/time_travel.txt", "w") do |file|
        file.write("#{params[:day]},#{params[:month]},#{params[:year]}")
      end

      render :text => "Oooh! We have skipped to #{params[:day]}/#{params[:month]}/#{params[:year]}"
    end
  end
end