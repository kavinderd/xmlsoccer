module Xmlsoccer

  class Config

  	DEMO = "Demo"
    FULL = "Full"
    DEMO_URL = "http://www.xmlsoccer.com/FootballDataDemo.asmx?WSDL"
    FULL_URL = "http://www.xmlsoccer.com/FootballData.asmx?WSDL"

    def self.valid_type?(type)
      [DEMO, FULL].include?(type)
    end

  end

end