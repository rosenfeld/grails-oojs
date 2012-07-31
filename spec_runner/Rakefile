# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.


application_path = File.expand_path('../spec_runner/config/application', __FILE__)
application_path = File.expand_path('../config/application', __FILE__) unless File.exist? application_path + '.rb'
require application_path
# If you want to run rake from your project's root, just "ln -s spec_runner/Rakefile"
# Or if you can't (Windows) or don't want to 'symlink', create a Rakefile
# in your root path with this content (require_relative is only supported by Ruby 1.9):
# require_relative 'spec_runner/Rakefile'

#Specs::Application.load_tasks
SandboxAssets::Engine.load_tasks
Oojs::Engine.load_generators

# this task is not required if Application.load_tasks is called instead:
# we do this to filter the available tasks shown in "rake -T"
task :environment do
  require File.expand_path '../environment', application_path
end

namespace :oojs do
  desc "Run oojspec spec-runner"
  #task :serve => 'sandbox_assets:serve'
  task :serve do
    SandboxAssets::Engine.config.sandbox_assets.template = 'oojspec/runner'
    Rake::Task["sandbox_assets:serve"].invoke
  end

  desc "generates a sample spec_helper.js.coffee"
  task spec_helper: :environment do
    ARGV.shift
    Rails::Generators.invoke 'oojs:spec_helper', ARGV, behavior: :invoke, destination_root: Rails.root
  end

  desc "generates a sample spec"
  task spec: :environment do
    ARGV.shift
    if name = ARGV.find{|a| a =~ /^--name=(.+)/}
      name = name.sub /^--name=/, ''
    else
      puts "You must specify the spec name. Use it like rake oojs:spec -- --name=shopping_cart\n\n"
      name = '--help'
    end
    Rails::Generators.invoke 'oojs:spec', [name], behavior: :invoke, destination_root: Rails.root
  end
end
