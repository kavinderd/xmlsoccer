module Xmlsoccer

  module Manifest
  	

  	def get_available_methods
  	  self.client.operations.each do |method|
  	  	self.class.send(:define_method, method) do |options={}|
  	  	  response = self.client.call(method, message: options.merge("ApiKey" => self.api_key))
  	  	  response = response.hash[:envelope][:body]["#{method}_response".to_sym]["#{method}_result".to_sym][:xmlsoccer_com]
  	  	  raise response.to_s unless response.respond_to?(:each)
  	  	  response[response.keys.first]
  	  	end
  	  end
  	end

  end
end