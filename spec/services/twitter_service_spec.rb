require 'rails_helper'


RSpec.describe TwitterService, type: :model do
  attr_reader :service

  before(:each) do
    @service = TwitterService.new
  end

  xit 'returns a list of tweets' do
    VCR.use_cassette("get_tweets") do
      service = TwitterService.new
      tweets = service.tweets

      expect(tweets).to be_an_instance_of(Array)
    end
  end

end
