module ShortlistImageSearch
  class GoogleSearch
    require 'net/http'
    attr_accessor :images, :result

    def initialize(images)
      @images = [*images]
      @result = []
    end

    def search
      @images.each do |image|
        url = uri_processing(image)
        @result << {image=>fetch(url)}
      end
    end

private
    def fetch(url, limit = 10)
      raise ArgumentError, 'too many HTTP redirects' if limit == 0
      ua  = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36"
      url = URI.parse(url)
      req = Net::HTTP::Get.new(url, { 'User-Agent'=> ua })
      response = Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') do |http|
        http.request(req)
      end

      case response
      when Net::HTTPRedirection then
        location = response['location']
        # warn "redirected to #{location}" uncomment for debugging
        fetch(location, limit - 1)
      when Net::HTTPSuccess then
        found = response.body.match(/Pages that include matching images/) ? true : false
      else
        response.body
      end

    end

    def uri_processing(uri)
      query       = CGI.escape(uri)
      search_path = "http://images.google.com/searchbyimage?image_url=#{query}&image_content=&filename="
    end
  end
end