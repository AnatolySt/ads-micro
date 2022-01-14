# frozen_string_literal: true

require_relative 'env'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use      Rack::PostBodyContentTypeParser
  helpers  Sinatra::Param
end
