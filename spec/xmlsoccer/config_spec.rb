require 'spec_helper'

module Xmlsoccer
  describe Config do

    it 'returns correct string for DEMO' do
      expect(Xmlsoccer::Config::DEMO).to eq('Demo')
    end
    
    it 'returns correct string for FULL' do
      expect(Xmlsoccer::Config::FULL).to eq('Full')
    end
  
    it "returns correct wsdl url for FULL_URL" do
      expect(Xmlsoccer::Config::FULL_URL).to eq('http://www.xmlsoccer.com/FootballData.asmx?WSDL')
    end
  
    it "returns correct wsdl url for DEMO_URL" do
      expect(Xmlsoccer::Config::DEMO_URL).to eq('http://www.xmlsoccer.com/FootballDataDemo.asmx?WSDL')
    end

  end
end