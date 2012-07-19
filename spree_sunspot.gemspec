# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_sunspot'
  s.version     = '1.0.0'
  s.summary     = 'Use Sunspot as search engine in Spree applications'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Damiano Giacomello'
  s.email             = 'damiano.giacomello@diginess.it'
  #s.homepage          = 'http://www.rubyonrails.org'

  #s.files         = `git ls-files`.split("\n")
  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'db/**/*', 'config/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core'

  s.add_dependency 'sunspot_rails'
  s.add_dependency 'sunspot_solr'
  s.add_dependency 'progress_bar'
end
