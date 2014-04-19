require 'spec_helper'

describe TimeTravel::TimeAdditions do
  class TestClass
    include ::TimeTravel::TimeAdditions
  end

  it 'should travel to time saved in file' do
    expect(File).to receive(:open).with("#{Rails.root}/tmp/time_travel.txt").and_return(double(read: '1,1,2014'))
    expect(Timecop).to receive(:travel).with(Time.zone.parse('2014/1/1'))

    TestClass.new.set_time_now
  end
end