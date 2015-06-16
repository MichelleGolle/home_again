# class TwitterService
#   attr_reader :client
#
#     def initialize
#       @client = Twitter::REST::Client.new do |config|
#         config.consumer_key        = ENV['twitter_key']
#         config.consumer_secret     = ENV['twitter_secret']
#         config.access_token        = ENV['twitter_access_token']
#         config.access_token_secret = ENV['twitter_access_token_secret']
#       end
#     end
#
#     # def tweets
#     #   client.user_timeline(user, count: 100).map(&:text)
#     # end
#
# end
