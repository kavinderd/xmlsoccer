module Xmlsoccer

  class Client
  	@api_type = Xmlsoccer::Config::DEMO
    @base_url
    @client
    
    include Manifest
    
    attr_accessor :base_url, :api_type, :api_key, :client

    def initialize(options={})
      raise "API Type not valid" unless Xmlsoccer::Config.valid_type?(options[:api_type])
      @api_key = options[:api_key]
      @api_type = options[:api_type]
      @base_url = Xmlsoccer::Config.const_get(@api_type.upcase + "_URL")
      @client = Savon.client(wsdl: @base_url)
      get_available_methods
    end



  end

end