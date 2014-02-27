module Xmlsoccer

  module Manifest
  
  	def get_availble_methods
  	  self.client.operations.each do |method|
  	  	define_method(method) do |*args|
  	  	  response = self.client.call(method, message: args.merge("ApiKey" => self.api_key))
  	  	  response = response.hash[:envelope][:body]["#{method}_response".to_sym]["#{method}_result".to_sym][:xmlsoccer_com]
  	  	  response.kind_of?(String) ? raise response.to_s : response.first
  	  	end
  	  end
  	end

  end
end