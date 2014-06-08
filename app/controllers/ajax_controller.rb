class AjaxController < ApplicationController
  def index
    @agencies = Agency.near(params[:query])
    render json: @agencies
  end
end
