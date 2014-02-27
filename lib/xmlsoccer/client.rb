module Xmlsoccer

  class Client
  	@api_type = Xmlsoccer::Config::DEMO
    @base_url
    
    include Manifest
    
    attr_accessor :base_url, :api_type, :api_key

    def initialize(options={})
      raise "API Type not valid" if Xmlsoccer::Config.valid_type?(options[:api_type])
      @api_key = options[:api_key]
      @api_type = options[:api_type]
      @base_url = Xmlsoccer::Config.const_get(@api_type.upcase + "_URL")
      @client = Savon.client(wsdl: @base_url)
      get_available_methods
    end



  end

end