module Xmlsoccer

  class Client

    include Manifest
    include Config 
    
    attr_accessor :base_url, :api_type, :api_key, :client

    def initialize(options={})
      raise "API Type not valid" unless valid_type?(options[:api_type])
      @api_key = options[:api_key]
      @api_type = options[:api_type]
      @base_url = api_url(@api_type)
      @client = Savon.client(wsdl: @base_url)
      get_available_methods
    end



  end

end