require 'spec_helper'

describe 'TimeTravel' do
  it 'should return the time travelled time' do
    get 'time_travel/time/travel/1/1/2014'

    get 'time_travel/time'

    expect(response.body).to eq('2014-01-01 00:00:00 UTC')
  end
end