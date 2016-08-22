require 'nokogiri'
require 'open-uri'

module BasketballReference
  class Client
    URL = 'http://www.basketball-reference.com'
    NOT_FOUND_TITLE = 'File Not Found | Basketball-Reference.com'

    def open_webpage(url)
      page = Nokogiri::HTML(open(url))
      page_found?(page) ? page : false
    end

    private

    def page_found?(page)
      page.title != NOT_FOUND_TITLE && page.title.include?('Basketball-Reference.com')
    end
  end
end
