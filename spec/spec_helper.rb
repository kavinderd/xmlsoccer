require 'xmlsoccer'
require "savon/mock/spec_helper"
require "fixtures/request_manager/hashed_responses"

RSpec.configure do |config|
   include Savon::SpecHelper
   include HashedResponses


   
end