require 'tweetstream'

class TwitterService

  TweetStream.configure do |config|
    config.consumer_key       = ENV['twitter_key']
    config.consumer_secret    = ENV['twitter_secret']
    config.oauth_token        = ENV['twitter_access_token']
    config.oauth_token_secret = ENV['twitter_access_token_secret']
    config.auth_method        = :oauth
  end

  def tweets
    TweetStream::Client.new.track('lostdog') do |status|
      puts "#{status.text}"
    end
  end

end
