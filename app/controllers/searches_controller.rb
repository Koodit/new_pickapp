class SearchesController < ApplicationController
  def show
    @rooms = Room.search params[:q][:room_name]
  end
end