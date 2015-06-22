class Tweet < ActiveRecord::Base

  validates :screen_name, presence: true
  validates :text, presence: true
  validates :url, presence: true
  validates :posted_at, presence: true

  def self.service
    @service ||= TwitterService.new
  end

  def self.lost_pet_tweets(city)
    tweet_data = service.lost_pet_tweets(city)
    tweets = tweet_data.map do |tweet|
      t = Tweet.new
      t.screen_name = tweet.user.screen_name
      t.text = tweet.text
      t.url = "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
      t.posted_at = tweet.created_at.strftime("%b %d %Y")
      t.save
      t
    end
    tweets.select(&:persisted?)
  end

  def self.found_pet_tweets(city)
    tweet_data = service.found_pet_tweets(city)
    tweets = tweet_data.map do |tweet|
      t = Tweet.new
      t.screen_name = tweet.user.screen_name
      t.text = tweet.text
      t.url = "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
      t.posted_at = tweet.created_at.strftime("%b %d %Y")
      t.save
      t
    end
    tweets.select(&:persisted?)
  end

  def self.clear_database
    Tweet.destroy_all
  end

end
