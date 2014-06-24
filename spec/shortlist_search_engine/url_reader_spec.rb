require_relative '../../lib/shortlist_image_search'
require 'spec_helper'
describe ShortlistImageSearch::UrlReader do

  describe "::load" do

    let(:reader) {ShortlistImageSearch::UrlReader.new("spec/support/url_list.txt")}

    before(:each) do
      reader.load
    end

    it "right number of lines" do
      expect(reader.urls.count).to eq 27
    end

    it "intializes @urls correctly" do
      reader.urls.each do |url|
        expect(url.keys.first).to match(/http/)
        expect(url.values.first).to eq 0
      end
    end
  end
end