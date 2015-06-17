class TwitterService

  attr_reader :client, :url

    def initialize
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['twitter_key']
        config.consumer_secret     = ENV['twitter_secret']
        config.access_token        = ENV['twitter_access_token']
        config.access_token_secret = ENV['twitter_access_token_secret']
      end
    end

  def lost_pet_tweets
    client.search("lostdog denver OR lostpuppy denver OR lostcat denver OR lostkitten denver OR missingdog denver OR missingcat denver OR missingpuppy denver OR missingkitten-RT", result_type: "recent").take(20)


      # Tweets.create!(screen_name: tweet.user.screen_name, text: tweet.text, url: "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}")

      # "@#{tweet.user.screen_name}: #{tweet.text} https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
      # @url =  "#{tweet.id}, https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
  end

  def found_pet_tweets
    client.search("founddog denver OR foundcat denver OR foundpuppy denver OR foundkitten denver -RT", result_type: "recent").take(20)
      # "@#{tweet.user.screen_name}: #{tweet.text}"

  end

end
