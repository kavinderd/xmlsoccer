
# Xmlsoccer [![Build Status](https://secure.travis-ci.org/eifion/url_formatter.png)](https://secure.travis-ci.org/eifion/url_formatter.png)

This is a Ruby wrapper for the excellent soccer data Api that can be found at www.xmlsoccer.com

The API has data for all of the major leagues for both current and historic matches.

## Installation

Add this line to your application's Gemfile:

    gem 'xmlsoccer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xmlsoccer

## Usage

The XmlSoccer API is a SOAP service so this gem uses the 'Savon' gem to interface.

I would recommend everyone interested in using this gem to first read the documentation of the API @ http://xmlsoccer.wikia.com/wiki/Main_Page

Additionally, the author of the API has put a rate limit on all requests. The gem does check against last request times, but it is still worth knowing: http://xmlsoccer.wikia.com/wiki/Time_interval_limits

Currently there is not support for Live Match Data.

Example Use:

XmlSoccer Api GetAllLeagues

	*You must have an API Key and know which type to use.  Currently there are two types Xmlsoccer::DEMO and Xmlsoccer::FULL*
	xmlsoccer_client = Xmlsoccer::RequestManager.new(api_key: 'Api_key', api_type:'Api_Type')

	leagues = xmlsoccer_client.get_all_leagues

	leagues.each do |league|
		put league[:name]
	end

As time permits I will add extensive Ruby specific documentation to the Wiki for this repo.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
