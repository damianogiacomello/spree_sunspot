if not defined?(SunspotRails::Generators::InstallGenerator)
  require 'generators/sunspot_rails/install/install_generator.rb'
end

module SpreeSunspot
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def self.source_paths
        [File.expand_path('../templates', __FILE__)]
      end

      def invoke_sunspot_rails_generator
        SunspotRails::Generators::InstallGenerator.start
      end
      
      def add_initializer
        template "initializer.erb", "config/initializers/spree_sunspot.rb"
      end

      def add_javascripts
        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_sunspot\n"
      end

      def add_stylesheets
        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/spree_sunspot\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install FROM=spree_sunspot'
      end
    end
  end
end
