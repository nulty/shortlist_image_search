require_relative '../../lib/shortlist_image_search'
require 'spec_helper'
describe "Search" do

  describe "search for the image" do
    it "processes one found image" do
      url = "http://upload.wikimedia.org/wikipedia/commons/8/85/Points_of_a_horse.jpg"
      searcher = ShortlistImageSearch::Google.new(url)
      searcher.search
      expect(searcher.result).to be_kind_of Array
      expect(searcher.result.first).to eq Hash[url,true]
    end

    it "processes one unfound image" do
      url = "http://static.picturk.com/photos/000/072/749/73c2752ef4c4a8c024937cd8eea32f49_bwthumb.jpg?1402073960"
      searcher = ShortlistImageSearch::Google.new(url)
      searcher.search
      expect(searcher.result).to be_kind_of Array
      expect(searcher.result.first).to eq Hash[url,false]
    end

    describe "Array of image paths" do
      it "processes many images" do
        url = ["http://upload.wikimedia.org/wikipedia/commons/8/85/Points_of_a_horse.jpg","http://static.picturk.com/photos/000/072/749/73c2752ef4c4a8c024937cd8eea32f49_bwthumb.jpg?1402073960"]
        searcher = ShortlistImageSearch::Google.new(url)
        searcher.search
        expect(searcher.result).to eq [{url.first=>true},{url.last=>false}]
      end
    end

    it "read the file" do
      File.open("spec/support/url_list.txt").each do |line|
        expect(line).to match /http:\/\//
      end
    end
  end
end