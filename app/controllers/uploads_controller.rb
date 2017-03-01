class UploadsController < ApplicationController
  def index
    
  end

  def new
    account.upload_video "http://localhost:3000/UmAt9EYOPCs", title: 'My video'
    redirect_to downloads_path
  end

  def info
  end
end
