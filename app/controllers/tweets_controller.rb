class TweetsController < ApplicationController

  def lost
    @city = params[:city]
  end

  def found
    @city = params[:city]
  end

  def lost_ajax
    @lost_pet_tweets = Tweet.lost_pet_tweets(params[:city])
    render :json => @lost_pet_tweets
  end

  def found_ajax
    @found_pet_tweets = Tweet.found_pet_tweets(params[:city])
    render :json => @found_pet_tweets
  end

end
