class UploadsController < ApplicationController

  def new

  end

  def create
    # Take the file and enter it into the DB
    DataFile.parse(params[:upload][:file])

    flash[:message] = 'Upload Successful.'
    redirect_to '/upload'
  end

end
