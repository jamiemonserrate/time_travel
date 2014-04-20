module TimeTravel
  class Engine < ::Rails::Engine
    isolate_namespace TimeTravel

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer 'railstimetravel.app_controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        #unless Rails.env.production? || Rails.env.test? || Rails.env.performance?
        if defined? ActionController::API
          ActionController::API.class_eval do
            include TimeTravel::ControllerAdditions
          end
        end

        if defined? ActionController::Base
          ActionController::Base.class_eval do
            include TimeTravel::ControllerAdditions
          end
        end

        if File.exist?(Rails.root + 'lib/jobs/resque_job.rb')
          require Rails.root + 'lib/jobs/resque_job'
          class ::Jobs::ResqueJob
            extend TimeTravel::TimeAdditions

            def self.before_perform_set_time
              set_time_now
            end
          end
        end
      end
    end
  end
end
