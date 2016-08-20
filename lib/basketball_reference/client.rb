require 'nokogiri'
require 'open-uri'

class Client
  URL = 'http://www.basketball-reference.com'

  def open_webpage(url)
    Nokogiri::HTML(open(url))
  end
end
