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

  def lost_pet_tweets(city)
    if (city != nil)
      spaceless = city.gsub(/\s+/, "")
    end
    client.search("lostdog #{spaceless} OR lostpuppy #{spaceless} OR lostcat #{spaceless} OR lostkitten #{spaceless} OR missingdog #{spaceless} OR missingcat #{spaceless} OR missingpuppy #{spaceless} OR missingkitten #{spaceless} -RT", result_type: "recent").take(100)
  end

  def found_pet_tweets(city)
    if (city != nil)
      spaceless = city.gsub(/\s+/, "")
    end
    client.search("founddog #{city} OR foundcat #{city} OR foundpuppy #{city} OR foundkitten #{city} -RT", result_type: "recent").take(100)
  end

end
