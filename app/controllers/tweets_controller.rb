require 'will_paginate/array'

class TweetsController < ApplicationController

  def lost
    @lost_pet_tweets = Tweet.lost_pet_tweets(params[:city]).paginate(page: params[:page])
  end

  def found
    @found_pet_tweets = Tweet.found_pet_tweets(params[:city])
  end

end
