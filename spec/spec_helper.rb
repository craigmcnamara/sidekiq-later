require "bundler/setup"
require "sidekiq/later"
require 'sidekiq/testing'
require 'rspec-sidekiq'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

class FakeThing
  include Sidekiq::Later::MethodMixin

  attr_accessor :id

  def self.find(id)
    new id
  end

  def initialize(id = rand(50000))
    @id = id
  end

  def one_plus_one
    1 + 1
  end
end
