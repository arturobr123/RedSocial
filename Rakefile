# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rspec/core/rake_task'
require "bundler/gem_tasks"

Rails.application.load_tasks
RSpec::Core::RakeTask.new
task :default => :spec






