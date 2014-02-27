module Xmlsoccer

  module Manifest
  
  	def get_availble_methods
  	  self.client.operations.each do |method|
  	  	define_method(method) do |options|
  	  	  response = self.client.call(method, message: options.merge("ApiKey" => self.api_key))
  	  	  response = response.hash[:envelope][:body]["#{method}_response".to_sym]["#{method}_result".to_sym][:xmlsoccer_com]
  	  	  response.first rescue response.to_s
  	  	end
  	  end
  	end

  end
end