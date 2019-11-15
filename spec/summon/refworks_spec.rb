require 'spec_helper'

describe Summon::Refworks do
  before do
    @search = Summon::Service.new(:transport => Summon::Transport::Canned.new).search
    @doc = @search.documents.first
  end
  it "extends summon document" do
    expect(@doc.to_refworks[:RT]).to eq(['Newspaper Article'])
  end


  it "uses the 'Generic' for RT if no mapping is present" do
    @doc.stub(:content_type) {"Opaque"}
    expect(@doc.to_refworks[:RT]).to eq(['Generic'])
  end


  it "primary title" do
    expect(@doc.to_refworks).to have_key(:'T1')
    expect(@doc.to_refworks[:T1]).to eq(['OBITUARIES'])
  end

  it "author " do
    expect(@doc.to_refworks).to have_key(:'A1')
    expect(@doc.to_refworks[:A1]).to eq(["Liang, Yong X, Gu, Miao N, Wang, Shi D, Chu, Hai C"])
  end

  describe "controlling how multiple values are concatenated" do
    before do
      @doc.stub(:multi_value) {[1,2,3]}
    end

    it "joins multiple values with ', ' by default" do
      #@doc.to_refworks(:multi_value => lambda {@doc.multi_value})[:multi_value].should eql ["1, 2, 3"]
      expect(@doc.to_refworks(:multi_value => lambda {@doc.multi_value})[:multi_value]).to eql (["1, 2, 3"])
    end

    it "accepts the option to preserve multiple values per field" do
      #@doc.to_refworks(:multi_value => lambda {@doc.multi_value.tag_per_value})[:multi_value].should eql [1,2,3]
      expect(@doc.to_refworks(:multi_value => lambda {@doc.multi_value.tag_per_value})[:multi_value]).to eql ([1, 2, 3])
    end
  end
end
