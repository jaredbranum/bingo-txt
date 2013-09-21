require 'open-uri'

configure do
  mime_type :plaintext, 'text/plain'
end

get '/' do
  haml :enter_seed
end

get '/scraper' do
  @oot_bingo_url = 'http://speedrunslive.com/tools/oot-bingo/'
  doc = Nokogiri::HTML(open(@oot_bingo_url))
  @goallist_js = doc.css('script[src*="goallist"]').first[:src]
  @generator_js = doc.css('script[src*="generator"]').first[:src]
  @time = Time.now.to_i
  haml :scraper
end

get '/card.txt' do
  content_type :plaintext
  params[:items].join("\r\n")
end