# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exception_alarm/version'
require 'exception_alarm/mpg123'
require 'mkmf'

Gem::Specification.new do |spec|
  spec.name          = "exception_alarm"
  spec.version       = ExceptionAlarm::VERSION
  spec.authors       = ["pioz"]
  spec.email         = ["epilotto@gmx.com"]

  spec.summary       = %q{Play alarm sound when an exception is raised}
  spec.description   = %q{Play alarm sound when an exception is raised.}
  spec.homepage      = "https://github.com/pioz/exception_alarm"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "os", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"

  unless find_executable0(ExceptionAlarm::PLAY_COMMAND)
    spec.post_install_message = ExceptionAlarm.mpg123_not_found
  end
end
