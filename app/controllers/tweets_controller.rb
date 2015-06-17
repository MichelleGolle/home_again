class TweetsController < ApplicationController

  def lost
    @lost_pet_tweets = Tweet.lost_pet_tweets.each do |tweet|
      Tweet.create(screen_name: tweet.user.screen_name, text: tweet.text, url: "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}")
      end

  end

  def found
    @found_pet_tweets = Tweet.found_pet_tweets.each do |tweet|
      Tweet.create(screen_name: tweet.user.screen_name, text: tweet.text, url: "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}")
    end
  end

end
