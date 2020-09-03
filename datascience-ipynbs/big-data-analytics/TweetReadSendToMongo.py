import json
from socket import socket
import tweepy
from tweepy import Stream
from tweepy import OAuthHandler
from pymongo import MongoClient
from tweepy.streaming import StreamListener

MONGO_HOST = 'mongodb://localhost/twitterdb'

WORDS = ['#bitcoin', '#cryptocurrency', '#crypto', '#litecoin', '#satoshi', '#btc', '#BTC', '#ethereum', '#HODL']

'''
Twitter Developer Account Credentials
'''

# Keys deleted, reach out to Sofia Dutta for access


class TweetStreamListener(StreamListener):
    def on_connect(self):
        print('Connected to Twitter streaming API.')
  
    def on_data(self, data):
        try:
            client = MongoClient(MONGO_HOST)
            '''
            Using MongoDB twitterdb database
            '''
            db = client.twitterdb
            datajson = json.loads(data)
            created_at = datajson['created_at']
            '''
            Message upon a tweet being collected
            '''
            print('Tweet collected at ' + str(created_at))
            db.twitter_search.insert(datajson)
        except Exception as e:
            print(e)

    def on_error(self, status):
        print(status)
        '''
        For not killing the tweet stream
        '''
        return True
    

'''
Create Auth object
'''
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_secret)
'''
Set up the listener. The 'wait_on_rate_limit=True' is needed to help with Twitter API rate limiting.
'''
twitter_stream = Stream(auth, TweetStreamListener(api=tweepy.API(wait_on_rate_limit=True)))
'''
Custom Filter to pull all traffic for the said filters to be collected to MongoDB
'''
print('Tracking: ' + str(WORDS))
twitter_stream.filter(languages=['en'],track=WORDS)
