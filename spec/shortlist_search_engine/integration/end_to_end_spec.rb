require 'spec_helper'

describe "End to End Spec" do

  it "reads urls from file and reports matches" do
    reader = ShortlistImageSearch::UrlReader.new("spec/support/image_urls.txt")
    reader.load
    searcher = ShortlistImageSearch::GoogleSearch.new(reader.urls)
    searcher.search
    expect(searcher.result).to eq [{reader.urls.first=>true},{reader.urls.last=>false}]
  end
end