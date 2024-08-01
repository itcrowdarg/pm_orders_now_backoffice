module Crons
  class CronExampleWorker
    include Sidekiq::Worker
    sidekiq_options queue: 'normal'
    sidekiq_options retry: false
    sidekiq_options failures: true

    def perform
      puts 'Run CronExampleWorker'
    rescue StandardError => e
      raise StandardError, "CronExampleWorker Failed: #{e.message}"
    end
  end
end
