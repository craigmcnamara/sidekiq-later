module Sidekiq
  module Later
    module MethodMixin
      class MethodProxy < BasicObject
        attr_accessor :target_class, :id, :inline

        def initialize(klass, id, inline = false)
          @target_class = klass
          @target_id = id
          @inline = inline
        end

        def method_missing(name, *args, &block)
          super unless target_class.new.respond_to?(name)

          worker_args = [target_class.to_s, @target_id, name, *args]

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
        MethodProxy.new(self.class, self.id, inline)
      end
    end
  end
end
