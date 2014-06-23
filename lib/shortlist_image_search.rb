require "shortlist_image_search/version"

module ShortlistImageSearch

  class UrlReader
    attr_accessor :urls

    def initialize(path)
      @path = path
      @urls = []
    end

    def load(options={})
      File.open(@path).each do |line|
        @urls << { line => 0 }
      end
    end
  end

end
