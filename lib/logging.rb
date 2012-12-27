require 'logger'

module Logging
  def log
    @log ||= Logging.logger_for(self.class.name)
  end

  @loggers = {}

  class << self
    def logger_for(name)
      @loggers[name] ||= setup_logger_for(name)
    end

    def setup_logger_for(name)
      log = Logger.new(STDOUT)
      log.progname = name
      log
    end
  end
end
