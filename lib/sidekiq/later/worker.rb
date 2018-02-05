require 'active_support/core_ext/string/inflections'

module Sidekiq
  module Later
    class Worker
      include Sidekiq::Worker
      sidekiq_options queue: :later

      def perform(klass, id, meth, *simple_args)
        klass.constantize.find(id).send(meth.to_sym, *simple_args)
      end
    end
  end
end
