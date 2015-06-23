require 'will_paginate/array'

class TweetsController < ApplicationController

  def lost
  end

  def found
  end

  def lost_ajax
    @lost_pet_tweets = Tweet.lost_pet_tweets(params[:city]).paginate(page: params[:page])
    render :json => @lost_pet_tweets
  end

  def found_ajax
    @found_pet_tweets = Tweet.found_pet_tweets(params[:city]).paginate(page: params[:page])
    render :json => @found_pet_tweets
  end

end
