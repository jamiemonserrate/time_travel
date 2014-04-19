require 'spec_helper'

describe TimeTravel::TimeController do
  let(:current_time) { Time.zone.parse('1 April 2014') }

  context '#index' do
    it 'should return current time' do
      allow(Time).to receive(:now).and_return(current_time)

      get :index, use_route: 'time_travel'

      expect(response.status).to eq(200)
      expect(response.body).to eq(current_time.to_s)
    end
  end

  context '#travel' do
    it 'should store time to which travel is wanted to' do
      file = double('file')
      expect(file).to receive(:write).with("1,1,2014")
      expect(File).to receive(:open).with("#{Rails.root}/tmp/time_travel.txt", "w").and_yield(file)
      allow(File).to receive(:open).with("#{Rails.root}/tmp/time_travel.txt").once.and_return(double(read: "1,1,2014")) #for the filter which will set the time

      get :travel, use_route: 'time_travel', day: 1, month: 1, year: 2014

      expect(response.status).to eq(200)
      expect(response.body).to eq("Oooh! We have skipped to 1/1/2014")
    end
  end

end
