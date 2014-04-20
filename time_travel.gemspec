$:.push File.expand_path("../lib", __FILE__)

require "time_travel/version"

Gem::Specification.new do |s|
  s.name        = "time_travel"
  s.version     = TimeTravel::VERSION
  s.authors     = ["Jamie Monserrate"]
  s.email       = ["jamiemonserrate@gmail.com"]
  s.homepage    = "https://github.com/jamiemonserrate/time_travel"
  s.summary     = "Allows users to time travel using timecop across multiple rails apps"
  s.description = "Allows users to time travel using timecop across multiple rails apps"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.4"
  s.add_dependency "timecop", "0.7.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails', '2.14'
  s.add_development_dependency 'rails-api', '0.2.0'
  s.add_development_dependency 'resque', '1.25.2'
end
