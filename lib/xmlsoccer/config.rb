module Xmlsoccer

  module Config

  	CONSTANTS = {
  	  demo: "Demo",
  	  full: "Full",
  	  demo_url: "http://www.xmlsoccer.com/FootballDataDemo.asmx?WSDL",
  	  full_url: "http://www.xmlsoccer.com/FootballData.asmx?WSDL"
  	}

  	DEMO = "Demo"
    FULL = "Full"
    DEMO_URL = "http://www.xmlsoccer.com/FootballDataDemo.asmx?WSDL"
    FULL_URL = "http://www.xmlsoccer.com/FootballData.asmx?WSDL"

    CONSTANTS.each do |method, value|
      define_method(method) {value}
    end

    def valid_type?(type)
      [DEMO, FULL].include?(type)
    end

    def api_url_for_type()
      raise "Invalid Type" unless valid_type?(type)
      CONSTANTS["#{type}_url".to_sym]
    end



  end

end