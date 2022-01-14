# frozen_string_literal: true

require 'rubygems'
require 'bundler'

Bundler.require
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

Dir['./app/**/*.rb'].each { |file| require file }

require './app'
run App
