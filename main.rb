require 'sinatra'
require 'haml'

configure do
  mime_type :plaintext, 'text/plain'
end

get '/' do
  haml :enter_seed
end

get '/scraper' do
  @time = Time.now.to_i
  haml :scraper
end

get '/card.txt' do
  content_type :plaintext
  params[:items].join("\r\n")
end