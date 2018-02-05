require 'sidekiq'
require 'sidekiq/later/version'
require 'sidekiq/later/method_mixin'
require 'sidekiq/later/worker'
require 'sidekiq/later/active_record' if defined?(ActiveRecord::Base)

module Sidekiq
  module Later
  end
end
