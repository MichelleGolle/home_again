class TweetsController < ApplicationController

  def lost
    @lost_pet_tweets = Tweet.lost_pet_tweets(params[:city])
  end

  def found
    @found_pet_tweets = Tweet.found_pet_tweets(params[:city])
  end

end
