# encoding: utf-8
require 'spec_helper'
require "savon/mock/spec_helper"
require "fixtures/request_manager/hashed_responses"

module Xmlsoccer
  describe Client do
   
    include Savon::SpecHelper
    include HashedResponses

    before(:all) { savon.mock!   }
    after(:all)  { savon.unmock! }

    it "should initialize a client with valid attributes" do
      c = Xmlsoccer::Client.new(api_key: "12345", api_type: 'Full')
      expect(c).to  be_instance_of(Xmlsoccer::Client)
    end

    it "should return an error with an invalid type" do
      expect{Xmlsoccer::Client.new(api_key: "12345", api_type: 'Invalid')}.to raise_exception
    end


  end
end
