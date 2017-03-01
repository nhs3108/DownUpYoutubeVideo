class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  YOUTUBE_CREDENTIAL = {
    api_key: "",
    client_id: "",
    client_secret: "",
    refresh_token: "",
    redirect_url: "http://localhost:8080/youtube/oauth2callback"
  }

  Yt.configure do |config|
    config.log_level = :debug
  end
  Yt.configuration.client_id = YOUTUBE_CREDENTIAL[:client_id]
  Yt.configuration.client_secret = YOUTUBE_CREDENTIAL[:client_secret]
  @account = Yt::Account.new refresh_token: YOUTUBE_CREDENTIAL[:refresh_token]

  def account
    @account ||= Yt::Account.new refresh_token: YOUTUBE_CREDENTIAL[:refresh_token]
  end

  def output_video name
    "videos/#{name}"
  end
end




