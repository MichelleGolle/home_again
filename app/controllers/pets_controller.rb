class PetsController < ApplicationController

  def lost
    tweets = Tweets.new
    @lost_pet_tweets = tweets.lost_pet_tweets
  end

  def found
    tweets = Tweets.new
    @found_pet_tweets = tweets.found_pet_tweets
  end

end
