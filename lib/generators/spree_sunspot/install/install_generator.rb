if not defined?(SunspotRails::Generators::InstallGenerator)
  require 'generators/sunspot_rails/install/install_generator.rb'
end

module SpreeSunspot
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def invoke_sunspot_rails_generator
        SunspotRails::Generators::InstallGenerator.start
      end

      def copy_initializer_file
        copy_file "spree_sunspot.rb", "config/initializers/spree_sunspot.rb"
      end

      def add_javascripts
        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_sunspot\n"
      end

      def add_stylesheets
        inject_into_file "app/assets/stylesheets/store/all.css", " *= require store/spree_sunspot\n", :before => /\*\//, :verbose => true
      end
    end
  end
end
