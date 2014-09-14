class AgenciesController < ApplicationController

  def index
    @agencies = Agency.all

    render json: @agencies
  end

end