# encoding: utf-8
require 'spec_helper'

describe Xmlsoccer do
  it 'returns correct string for DEMO' do
    expect(Xmlsoccer::DEMO).to eq('Demo')
  end
  
  it 'returns correct string for FULL' do
    expect(Xmlsoccer::FULL).to eq('Full')
  end
  
  describe Xmlsoccer::RequestManager do
    it 'initializes with an api key and version' do
      (Xmlsoccer::RequestManager.new(api_key: 'testkey', api_type: Xmlsoccer::DEMO)).should be_an_instance_of(Xmlsoccer::RequestManager)
    end
    
    
  end
end

