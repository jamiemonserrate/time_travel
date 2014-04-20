require 'spec_helper'

describe 'TimeTravel' do
  let(:day) {"%02d" % rand(1..31)}
  it 'should return the time travelled time' do
    get 'time_travel/time/travel/1/1/2014'

    get 'time_travel/time'

    expect(response.body).to eq('2014-01-01 00:00:00 UTC')
  end

  context 'for different rails controllers' do
    it 'should be able to time travel for rails api controllers' do
      get "time_travel/time/travel/#{day}/1/2014"

      get 'rails_api_controller_time'

      expect(response.body).to eq("2014-01-#{day} 00:00:00 UTC")
    end

    it 'should be able to time travel for regular rails controllers' do
      get "time_travel/time/travel/#{day}/1/2014"

      get 'regular_rails_controller_time'

      expect(response.body).to eq("2014-01-#{day} 00:00:00 UTC")
    end

    it 'should be able to time travel for resque jobs' do
      get "time_travel/time/travel/#{day}/1/2014"

      Resque.inline = true
      Resque.enqueue(::Jobs::DateDependentResqueJob)

      expect(::Jobs::DateDependentResqueJob.instance_variable_get(:@current_time).to_s).to eq("2014-01-#{day} 00:00:00 UTC")
    end
  end
end