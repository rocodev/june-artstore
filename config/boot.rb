# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

# If your default settings seem to be overwriting your environment-specific settings, including the following lines in your config/boot.rb file may solve the problem
# require 'yaml'
# YAML::ENGINE.yamler= 'syck'
