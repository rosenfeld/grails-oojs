require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] = File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup'

require "sprockets/railtie"

# If you precompile assets before deploying to production, use this line
Bundler.require(*Rails.groups(:assets => %w(development test)))
# If you want your assets lazily compiled in production, use this line
# Bundler.require(:default, :assets, Rails.env)

module Specs
  class Application < Rails::Application
    config.root = File.expand_path '../..', __FILE__ if File.exists? 'spec_runner'
    config.active_support.deprecation = :log
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # Do not compress assets
    config.assets.compress = false

    # Expands the lines which load the assets
    config.assets.debug = true

    # Compress JavaScripts and CSS
    #config.assets.compress = true

    # Generate digests for assets URLs
    #config.assets.digest = true

    # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
    # config.assets.precompile += %w( search.js )

    #config.sandbox_assets.template = 'jasmine/runner' # already set by the jasmine:serve task

    config.assets.paths.concat %w(spec/assets/css spec/assets/js spec/assets/images)

    # Example for enabling Grails assets under web-app:
    #config.assets.paths.concat %w(../web-app/js ../web-app/css)

    config.logger = ActiveSupport::BufferedLogger.new(Rails.root.join('log/server.log'))
  end
end
