# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markdown_linker/version'
require 'markdown_linker/description'

Gem::Specification.new do |spec|
  spec.name          = "markdown_linker"
  spec.version       = MarkdownLinker::VERSION
  spec.authors     = ['Ryo Kosuge']
  spec.email       = ['ryo.kosuge@gmail.com']
  spec.summary     = MarkdownLinker::DESCRIPTION
  spec.description = MarkdownLinker::DESCRIPTION
  spec.homepage    = 'https://github.com/ryokosuge/markdown-linker'
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'
  spec.rubygems_version = '1.3.6'

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

  spec.add_dependency 'commander', "~> 4.4"

  spec.add_runtime_dependency("nokogiri", [">= 1.3.3"])

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
