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

    if params[:open_monday]
      @agencies = @agencies.where("open_mon_am = true OR open_mon_pm = true")
    end
      
    if params[:open_tuesday]
      @agencies = @agencies.where("open_tue_am = true OR open_tue_pm = true")
    end

    if params[:open_wednesday]
      @agencies = @agencies.where("open_wed_am = true OR open_wed_pm = true")
    end

    if params[:open_thursday]
      @agencies = @agencies.where("open_thr_am = true OR open_thr_pm = true")
    end

    if params[:open_friday]
      @agencies = @agencies.where("open_fri_am = true OR open_fri_pm = true")
    end

    if params[:open_saturday]
      @agencies = @agencies.where("open_sat_am = true OR open_sat_pm = true")
    end

    if params[:open_sunday]
      @agencies = @agencies.where("open_sun_am = true OR open_sun_pm = true")
    end

    render json: @agencies.as_json(methods: :is_open)
  end
end
