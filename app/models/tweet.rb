class Tweet < ActiveRecord::Base

  def self.service
    @service ||= TwitterService.new
  end

  def self.lost_pet_tweets
    service.lost_pet_tweets
  end

  def self.found_pet_tweets
    service.found_pet_tweets
  end

end
