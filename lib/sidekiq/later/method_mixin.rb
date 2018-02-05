module Sidekiq
  module Later
    module MethodMixin
      class MethodProxy < BasicObject
        attr_accessor :target, :inline

        def initialize(target, inline = false)
          @target = target
          @inline = inline
        end

        def method_missing(name, *args, &block)
          super unless target.respond_to?(name)

          worker_args = [target.class.to_s, target.id, name, *args]

          if inline
            Worker.new.perform *worker_args
          else
            Worker.perform_async *worker_args
          end
        end

        def respond_to_missing?(name, include_private = false)
          target_class.new.respond_to?(name)
        end
      end

      def later(inline: false)
        MethodProxy.new(self, inline)
      end
    end
  end
end
