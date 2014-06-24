module ShortlistImageSearch
  class SearchResultPrinter
    attr_accessor :path, :data, :file_name

    def initialize(results,file_name)
      @data      = results.partition { |res| res.values.first == true }
      @path      = "results/"
      @file_name = file_name
    end

    def print
      f = File.new(path + file_name, "w+")
      f.puts format
      f.close
    end

  private
    def format
      formatted = ""
      formatted << "\n\nMatched on Google - must check for dupilcation and stealing\n\n"
      data.first.each {|e| formatted << "#{e.keys.first}\n" }
      formatted << "\n\nNo match on Google for these\n\n"
      data.last.each {|e| formatted << "#{e.keys.first}\n" }
      formatted
    end

  end
end