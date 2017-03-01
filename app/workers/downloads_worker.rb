class DownloadsWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  
  def perform url, name
    logger.info "Doing hard work"
    Sidekiq.redis { |c| logger.info "redis location: [#{c.client.location }]" }

    redis_info = Sidekiq.redis { |conn| conn.info }
    logger.info "connected clients: [#{redis_info['connected_clients']}]"


    logger.info "hard work was done"
    YoutubeDL.download url, output: "videos/#{name}"
  end
end