class TwitterService

  attr_reader :client

    def initialize
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['twitter_key']
        config.consumer_secret     = ENV['twitter_secret']
        config.access_token        = ENV['twitter_access_token']
        config.access_token_secret = ENV['twitter_access_token_secret']
      end
    end

  def lost_pet_tweets
    client.search("lostdog OR lostpuppy OR lostcat OR lostkitten OR lost dog OR lost cat OR lost puppy OR lost kitten OR missing dog OR missing cat OR missing puppy OR missing kitten", result_type: "recent").take(10).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end

  def found_pet_tweets
    client.search("founddog OR foundcat OR foundpuppy OR foundkitten OR found dog OR found cat OR found puppy OR found kitten", result_type: "recent").take(10).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end

end
