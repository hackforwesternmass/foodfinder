class Admin::AgenciesController < ApplicationController
  before_action :authenticate_user!
  before_filter do
    redirect_to root_path unless current_user.admin?
  end

  def index
    @failed_agencies = Agency.where('longitude is NULL')
    @agencies = Agency.all
  end

  def geocode
    @agency = Agency.find(params[:id])
    @agency.geocode
    @agency.save

    flash[:message] = 'Geocode Complete.'
    redirect_to admin_agencies_url
  end

  def geocode_all
    @failed_agencies = Agency.where('longitude is NULL OR longitude = ?', "")
    for agency in @failed_agencies
      agency.geocode
      agency.save
    end

    flash[:message] = 'Geocode Complete.'
    redirect_to admin_agencies_url
  end

  def upload
    # Take the file and enter it into the DB
    DataFile.parse(params[:upload][:file])

    flash[:message] = 'Upload Successful.'
    redirect_to admin_agencies_url
  end

end
