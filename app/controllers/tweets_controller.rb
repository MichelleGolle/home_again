class TweetsController < ApplicationController

  def create_lost
    Tweet.lost_pet_tweets.each do |tweet|
      Tweet.create(screen_name: tweet.user.screen_name, text: tweet.text, url: "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}")
    end
  end

  def create_found
    Tweet.found_pet_tweets.each do |tweet|
      Tweet.create(screen_name: tweet.user.screen_name, text: tweet.text, url: "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}")
    end
  end

end
