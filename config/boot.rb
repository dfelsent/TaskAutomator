#require 'yaml'
#YAML::ENGINE.yamler = 'syck'

# Set up gems listed in the Gemfile.
require 'rubygems'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

Encoding.default_external = 'UTF-8'
Encoding.default_internal = 'UTF-8'