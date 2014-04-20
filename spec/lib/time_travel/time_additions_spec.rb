require 'spec_helper'

describe TimeTravel::TimeAdditions do
  class TestClass
    include ::TimeTravel::TimeAdditions
  end

  it 'should travel to time saved in file' do
    allow(File).to receive(:exist?).with("#{Rails.root}/tmp/time_travel.txt").and_return(true)
    expect(File).to receive(:open).with("#{Rails.root}/tmp/time_travel.txt").and_return(double(read: '1,1,2014'))
    expect(Timecop).to receive(:travel).with(Time.zone.parse('2014/1/1'))

    TestClass.new.set_time_now
  end

  it 'should not time travel if time travel file is not present' do
    expect(File).to receive(:exist?).with("#{Rails.root}/tmp/time_travel.txt").and_return(false)

    expect(Timecop).to receive(:travel).never

    TestClass.new.set_time_now
  end

  it 'should stop time travel if file contains text that is not a date' do
    allow(File).to receive(:exist?).with("#{Rails.root}/tmp/time_travel.txt").and_return(true)
    expect(File).to receive(:open).with("#{Rails.root}/tmp/time_travel.txt").and_return(double(read: 'present'))

    expect(Timecop).to receive(:return).once

    TestClass.new.set_time_now
  end
end