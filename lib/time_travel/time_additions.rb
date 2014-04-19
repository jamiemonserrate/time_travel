module TimeTravel
  module TimeAdditions
    def set_time_now
      #if File.exist?("#{Rails.root}/tmp/time_travel.txt")
        date = File.open("#{Rails.root}/tmp/time_travel.txt").read.strip.split(",")
      #
      #  if date.size == 3
          Timecop.travel(Time.zone.parse("#{date[0]}/#{date[1]}/#{date[2]}"))
      #  else
      #    Timecop.return
      #  end
      #end
    end
  end
end
