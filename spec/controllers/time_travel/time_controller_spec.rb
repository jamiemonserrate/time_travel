require 'spec_helper'

describe TimeTravel::TimeController do
  let(:current_time) { Time.zone.parse("1 April 2014") }

  it "should return time" do
    allow(Time).to receive(:now).and_return(current_time)

    get :index, use_route: 'time_travel'

    expect(response.status).to eq(200)
    expect(response.body).to eq(current_time.to_s)
  end
end
