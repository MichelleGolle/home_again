class TweetsController < ApplicationController

  def lost
    @lost_pet_tweets = Tweet.lost_pet_tweets

  end

  def found
    @found_pet_tweets = Tweet.found_pet_tweets
  end

end
