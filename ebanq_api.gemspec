lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ebanq_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'ebanq_api'
  spec.version       = EbanqApi::VERSION
  spec.authors       = ['Nadiia Trofymova', 'Agilie Team']
  spec.email         = %w[nadia.trofimova@agilie.com web@agilie.com]

  spec.summary       = 'A Ruby wrapper for the EBANQ Rest API'
  spec.description   = 'A Ruby wrapper for the EBANQ Rest API'


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir["README.md","Gemfile","Rakefile", "lib/**/*"]

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
