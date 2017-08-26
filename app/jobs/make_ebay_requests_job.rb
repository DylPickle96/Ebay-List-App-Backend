require 'open-uri'
require 'json'

word_list = [
  'people',
  'history',
  'art',
  'world',
  'information',
  'map',
  'family',
  'government',
  'health',
  'system',
  'computer',
  'meat',
  'year',
  'music',
  'reading',
  'method',
  'data',
  'food',
  'understanding',
  'theory',
  'law',
  'bird',
  'literature',
  'problem',
  'software',
  'control',
  'knowledge',
  'power',
  'ability',
  'economics',
  'love',
  'internet',
  'television',
  'science',
  'library',
  'nature',
  'idea',
  'temperature',
  'investment',
  'area',
  'society',
  'activity',
  'story',
  'industry',
  'media',
  'thing',
  'oven',
  'community',
  'definition',
  'safety',
  'quality',
  'development',
  'language',
  'management',
  'player',
  'variety',
  'video',
  'week',
  'security',
  'country',
  'exam',
  'movie',
  'organization',
  'equipment',
  'physics',
  'analysis',
  'policy',
  'series',
  'thought',
  'basis',
  'boyfriend',
  'direction',
  'strategy',
  'technology',
  'army',
  'camera',
  'freedom',
  'paper',
  'environment',
  'child',
  'instance',
  'month',
  'truth',
  'marketing',
  'university',
  'writing',
  'article',
  'department',
  'difference',
  'goal',
  'news',
  'audience',
  'fishing',
  'growth',
  'income',
  'marriage',
  'user',
  'combination',
  'failure',
  'meaning',
  'medicine',
  'philosophy',
  'teacher'
]

class MakeEbayRequestsJob < ApplicationJob
  queue_as :default

  def perform()
    ten_words = []

    10.times do
      rand_num = Random.rand(word_list.length)
      ten_words.push(word_list[rand_num])
    end

    random_listings = []

    ten_words.each do |word|
      ebay_request = JSON.parse(open(
        "https://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-NAME=FindingService&SERVICE-VERSION=1.12.0&SECURITY-APPNAME=DylanSmi-TestApp-PRD-5b7edec1b-eaa1e0c6&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=#{word}&paginationInput.entriesPerPage=10&GLOBAL-ID=EBAY-ENCA&siteid=2"
      ).read)

      random_listing_number = Random.rand(ebay_request['findItemsByKeywordsResponse'][0]['searchResult'][0]['item'].length)
      random_listing = ebay_request['findItemsByKeywordsResponse'][0]['searchResult'][0]['item'][random_listing_number]

      random_listings.push(random_listing)
    end

    parsed_objects = []

    random_listings.each do |listing|
      object = {
        title:listing['title'][0],
        category:listing['primaryCategory'][0]['categoryName'][0],
        picture:listing['galleryURL'][0],
        location:listing['location'][0],
        price:listing['sellingStatus'][0]['convertedCurrentPrice'][0]['__value__'][0],
        startdate:listing['listingInfo'][0]['startTime'][0]
      }
      parsed_objects.push(object)
    end

    return parsed_objects
  end
end
