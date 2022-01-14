# frozen_string_literal: true

require_relative 'env'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use      Rack::PostBodyContentTypeParser
  helpers  Sinatra::Param

  get '/' do
    param :page, Integer, min: 1, default: 1
    param :per, Integer, min: 5, default: 25

    collection = PaginationUtil.new(Ad).paginate(params[:per], params[:page])
    [200, { ads: collection }.to_json]
  end

  post '/ad' do
    param :user_id, Integer, required: true
    param :title, String, required: true
    param :description, String, required: true
    param :city, String, required: true

    ad = Ad.create(params)

    if ad.persisted?
      [200, { ad: ad }.to_json]
    else
      [422, { errors: ad.errors.full_messages.join("\n") }.to_json]
    end
  end
end
