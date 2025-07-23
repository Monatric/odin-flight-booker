class FlightsController < ApplicationController
  def index
  end

  def search
    p params
    render :index
  end
end
