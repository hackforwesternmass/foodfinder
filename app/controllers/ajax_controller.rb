class AjaxController < ApplicationController
  def index
    @agencies = Agency.near(params[:query])

    if params[:groceries]
      @agencies = @agencies.where("agency_type_id = ? OR agency_type_id = ?", "H", "P")
    end

    if params[:hot_meals]
      @agencies = @agencies.where("agency_type_id = ?", "K")
    end

    if params[:brown_bag]
      @agencies = @agencies.where("agency_type_id = ?", "B")
    end

    render json: @agencies
  end
end
