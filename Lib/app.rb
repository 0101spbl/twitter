

require 'twitter'
require 'dotenv'


Dotenv.load('../.env')

def login_twitter
    client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
end

def update(client)
    client.update("hi ")
end

def follow(client)
    client.follow("babadr")
end

def like(client)
    tweet_id = client.user_timeline("babadr")
    puts tweet_id
    client.favorite(tweet_id)
end

def perform
    #update(login_twitter)
    #follow(login_twitter)
    like(login_twitter)
end

perform