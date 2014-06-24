module ShortlistImageSearch
  class UrlReader
    attr_accessor :urls

    def initialize(path)
      @path = path
      @urls = []
    end


    def load(options={})
      File.open(@path).each do |line|
        @urls << line
      end
    end
  end
end