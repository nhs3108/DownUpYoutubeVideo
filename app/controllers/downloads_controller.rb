class DownloadsController < ApplicationController
  def index
    
  end

  def new
  	
  end

  def create
    video_url = params[:video_url]
    video = Yt::Video.new url: video_url
    DownloadsWorker.perform_async video_url, video.id
    redirect_to downloads_path
  end
end
