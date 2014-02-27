require "xmlsoccer/version"
require "xmlsoccer/manifest"
require "xmlsoccer/config"
require "xmlsoccer/client"
require 'savon'

module Xmlsoccer
  
    DEMO = "Demo"
    FULL = "Full"
    WAIT = 'Wait 5 minutes between calls'
    DEMO_URL = "http://www.xmlsoccer.com/FootballDataDemo.asmx?WSDL"
    FULL_URL = "http://www.xmlsoccer.com/FootballData.asmx?WSDL"

    def self.valid_type?(type)
      [DEMO, FULL].include?(type)
    end

  
end
