require 'sidekiq/later/version'
require 'sidekiq/later/method_mixin'
require 'sidekiq/later/worker'

module Sidekiq
  module Later
  end
end

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, Sidekiq::Later::MethodMixin
end
