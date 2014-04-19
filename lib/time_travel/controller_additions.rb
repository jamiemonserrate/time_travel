module TimeTravel
  module ControllerAdditions
    def self.included(base)
      base.class_eval do
        prepend_before_filter :set_time_now
        include TimeAdditions
      end
    end
  end
end
