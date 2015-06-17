require 'rails_helper'


RSpec.describe TwitterService, type: :model do
  attr_reader :service

  before(:each) do
    @service = TwitterService.new
  end

  it 'returns a list of lost pet tweets' do

    VCR.use_cassette("get_lost_pet_tweets") do
      service = TwitterService.new
      tweets = service.lost_pet_tweets

      expect(tweets).to be_an_instance_of(Array)
    end
  end

  it 'returns a list of found pet tweets' do

    VCR.use_cassette("get_found_pet_tweets") do
      service = TwitterService.new
      tweets = service.found_pet_tweets

      expect(tweets).to be_an_instance_of(Array)
    end
  end

end
