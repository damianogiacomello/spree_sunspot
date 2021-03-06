require 'spree_sunspot/setup'
require 'spree_sunspot/filter_support'

module SpreeSunspot
  class Engine < Rails::Engine
    engine_name 'spree_sunspot'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      ActionView::Base.class_eval do
        include SpreeSunspot::FilterSupport::Helpers
      end
    end

    config.to_prepare &method(:activate).to_proc

    initializer "spree.sunspot.search_config", :after => "spree.load_preferences" do |app|
      Spree::BaseController.class_eval do
        include(SpreeSunspot::FilterSupport)
        filter_support
      end

      app.config.spree.preferences.searcher_class = SpreeSunspot::Search
    end
  end
end
