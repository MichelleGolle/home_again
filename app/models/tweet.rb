class Tweet < ActiveRecord::Base

  has_many :media

  def self.service
    @service ||= TwitterService.new
  end

  def self.lost_pet_tweets
    tweet_data = service.lost_pet_tweets
    tweets = tweet_data.map do |tweet|
      t = Tweet.new
      t.screen_name = tweet.user.screen_name
      t.text = tweet.text
      t.url = "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
      t.posted_at = tweet.created_at.strftime("%b %d %Y")
      # if t.media != nil
      #   t.location = t.media.first.url
      # end
      #t.image not sure how to do this because there can be multiple
      # tweet.media.each do |medium|
      #   m = Medium.new
      #   m.url = medium.url
      #   tweet.media << m
      # end
      t.save
      t
    end
    tweets.select(&:persisted?)
  end

  def self.found_pet_tweets
    tweet_data = service.found_pet_tweets
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

  def self.clear_database
    Tweet.destroy_all
  end

end
