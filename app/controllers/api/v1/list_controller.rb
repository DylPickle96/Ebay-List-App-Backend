class Api::V1::ListController < ApplicationController
  def index
    @list = List.all
  end

  def create
    list = request.raw_post
    print list['list']
  end
end
