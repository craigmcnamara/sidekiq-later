
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sidekiq/later/version"

Gem::Specification.new do |spec|
  spec.name = "sidekiq-later"
  spec.version = Sidekiq::Later::VERSION
  spec.authors = ["Craig McNamara"]
  spec.email = ["craig.mcnamara@gmail.com"]

  spec.summary = %q{Simple delayed method dispatching backed by sidekiq }
  spec.description = %q{Like the .delay method without YAML serialization.}
  spec.homepage = "https://github.com/craigmcnamara/sidekiq-later"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
