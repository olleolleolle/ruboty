require "active_support/concern"
require "active_support/core_ext/module/delegation"
require "active_support/core_ext/string/inflections"
require "bundler"
require "dotenv"
require "mem"
require "slop"

module Ruboty
  class << self
    include Mem

    def logger
      @logger ||= Ruboty::Logger.new($stdout)
    end

    def die(message)
      logger.error("Error: #{message}")
      exit(1)
    end

    def handlers
      []
    end
    memoize :handlers

    def actions
      handlers.map(&:actions).flatten.sort_by(&:all?)
    end
  end
end

require "ellen/action"
require "ellen/actions/base"
require "ellen/actions/help"
require "ellen/actions/ping"
require "ellen/actions/whoami"
require "ellen/adapter_builder"
require "ellen/env"
require "ellen/env/missing_required_key_error"
require "ellen/env/validatable"
require "ellen/env/validation_error"
require "ellen/adapters/base"
require "ellen/adapters/shell"
require "ellen/brains/base"
require "ellen/brains/memory"
require "ellen/command_builder"
require "ellen/commands/base"
require "ellen/commands/generate"
require "ellen/commands/run"
require "ellen/handlers/base"
require "ellen/handlers/help"
require "ellen/handlers/ping"
require "ellen/handlers/whoami"
require "ellen/logger"
require "ellen/message"
require "ellen/robot"
require "ellen/version"
