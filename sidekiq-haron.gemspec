
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sidekiq/haron/version"

Gem::Specification.new do |spec|
  spec.name          = "sidekiq-haron"
  spec.version       = Sidekiq::Haron::VERSION
  spec.authors       = ["Serg F"]
  spec.email         = ["wolferingys@gmail.com"]

  spec.summary       = %q{Transfer some data to sidekiq job and can tag sidekiq logs}
  spec.description   = %q{Transfer some metadata to sidekiq job, can tag sidekiq logs and add logging job args}
  spec.homepage      = "https://github.com/Rnd-Soft/sidekiq-haron"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sidekiq", "~> 7.3.0"
  spec.add_dependency "rails", '~> 7.0'
  spec.add_development_dependency "bundler", "~> 2.5.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "awesome_print"
end
