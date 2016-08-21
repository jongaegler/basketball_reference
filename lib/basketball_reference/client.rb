require 'nokogiri'
require 'open-uri'

class Client
  URL = 'http://www.basketball-reference.com'
  NOT_FOUND_TITLE = 'File Not Found | Basketball-Reference.com'

  def open_webpage(url)
    page = Nokogiri::HTML(open(url))
    page_found?(page) ? page : false
  end

  private

  def page_found?(page)
    page.title != NOT_FOUND_TITLE
  end
end
