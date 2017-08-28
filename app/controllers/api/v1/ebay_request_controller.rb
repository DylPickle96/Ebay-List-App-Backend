class Api::V1::EbayRequestController < ApplicationController
  def index
    @objects = api_caller()

    @list = List.all
    @list.destroy_all

    @objects.each do |object|

      @list_item = List.new

      @list_item['title']= object[:title]
      @list_item['category'] = object[:category]
      @list_item['picture'] = object[:picture]
      @list_item['location'] = object[:location]
      @list_item['price'] = object[:price]
      @list_item['startdate'] = object[:startdate]
      @list_item['url'] = object[:url]

      @list_item.save
    end
  end
end
