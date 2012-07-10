# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_sunspot'
  s.version     = '0.70.0'
  s.summary     = 'Use Sunspot as search engine in Spree applications'
  s.description = 'Use Sunspot for searching and filtering products in Spree applications'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Chandramohan Rangaswamy'
  s.email             = 'chandru@simplelife.in'
  s.homepage          = 'http://www.simplelife.in'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core'
  s.add_dependency 'sunspot_rails'
  
  s.add_development_dependency 'sunspot_solr'
end
