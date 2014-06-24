require 'spec_helper'

describe ShortlistImageSearch::SearchResultPrinter do

  before(:each) do
    @google = double("ShortlistImageSearch::GoogleSearch", :result=>[{"img1"=>true},{"img2"=>false},{"img3"=>true}])
    @result = @google.result
  end

  it "prints the results" do
    printer = ShortlistImageSearch::SearchResultPrinter.new(@result,"test_competition.txt")
    printer.print
    expect(File.exist?("results/test_competition.txt")).to eq true
    File.delete("results/test_competition.txt")
  end
end