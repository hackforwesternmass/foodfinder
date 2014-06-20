class AjaxController < ApplicationController
  def index
    @agencies = Agency.near(params[:query]).limit(20)

    if params[:groceries]
      @agencies = @agencies.where("agency_type_id = ? OR agency_type_id = ?", "H", "P")
    end

    if params[:hot_meals]
      @agencies = @agencies.where("agency_type_id = ?", "K")
    end

    if params[:brown_bag]
      @agencies = @agencies.where("agency_type_id = ?", "B")
    end

    if params[:open_now]
      @to_ret = []
      @agencies.each do |agency|
        if agency.is_open
          @to_ret.push(agency)
        end
      end
      @agencies = @to_ret
    end

    render json: @agencies.as_json(methods: :is_open)
  end
end
