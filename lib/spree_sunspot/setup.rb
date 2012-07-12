require 'sunspot_rails'
require 'spree_sunspot/filters'
require 'singleton'

module SpreeSunspot
  class Setup
    include Singleton
    IGNORE_MAX = 1000000000
    @@filters = SpreeSunspot::Filters.new

    @@configuration = nil
    def self.configure(&blk)
      @@configuration = blk
    end

    def self.configuration
      @@configuration
    end

    def self.filters(&blk)
      yield @@filters if block_given?
      @@filters
    end
  end
end
