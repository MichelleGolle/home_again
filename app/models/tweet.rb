class Tweet < ActiveRecord::Base

  def self.service
    @service ||= TwitterService.new
  end

  def self.lost_pet_tweets(city)
    tweet_data = service.lost_pet_tweets(city)
    # tweet_data = JSON.parse(response)
    tweets = tweet_data.map do |tweet|
      t = Tweet.new
      t.screen_name = tweet.user.screen_name
      t.text = tweet.text
      t.url = "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
      t.posted_at = tweet.created_at
      #t.image not sure how to do this because there can be multiple
      t.save
      t
    end
    tweets.select(&:persisted?)
  end

  def self.found_pet_tweets
    tweet_data = service.found_pet_tweets
    # tweet_data = JSON.parse(response)
    tweets = tweet_data.map do |tweet|
      t = Tweet.new
      t.screen_name = tweet.user.screen_name
      t.text = tweet.text
      t.url = "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
      t.save
      t
    end
    tweets.select(&:persisted?)
  end

end
