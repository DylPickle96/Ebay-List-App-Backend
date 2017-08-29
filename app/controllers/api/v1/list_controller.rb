class Api::V1::ListController < ApplicationController
  def index
    @list = List.all
  end

  def create
    require 'json'
    @list = List.all

    raw_list = request.raw_post()
    raw_list = JSON.parse(raw_list)
    raw_list = raw_list['list']

    @list.destroy_all

    raw_list.each do |object|
      @list_item = List.new

      @list_item['title']= object['title']
      @list_item['category'] = object['category']
      @list_item['picture'] = object['picture']
      @list_item['location'] = object['location']
      @list_item['price'] = object['price']
      @list_item['startdate'] = object['startdate']
      @list_item['url'] = object['url']

      @list_item.save
    end

  end

  private

  def list_params
    params.require(:list).permit([:title, :category, :picture, :location, :price, :startdate, :url])
  end
end
