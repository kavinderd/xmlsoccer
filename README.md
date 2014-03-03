
# Xmlsoccer [![Build Status](https://secure.travis-ci.org/eifion/url_formatter.png)](https://secure.travis-ci.org/eifion/url_formatter.png)

This is a Ruby wrapper for the excellent soccer data Api that can be found at www.xmlsoccer.com

The API has data for all of the major leagues for both current and historic matches.

#Version 0.1.0
The new version is drastically different from the previous version and will break implementations of the previous version. I appologize for this inconvenience. I considered supporting older implementations but the new version is far more elegant and support for deprecated method calls would be a big hindrance in taking this gem any further.  However, the new version has all available methods from xmlsoccer with a fraction of the total lines, so I do hope that is consolation. 

I will keep the documentation for Version 0.0.1 for the forseeable future, which you can find below.

##Installation

Add this line to your application's Gemfile:

    gem 'xmlsoccer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xmlsoccer
    
##Usage 

The XmlSoccer API is a SOAP service so this gem uses the 'Savon' gem to interface.

I would recommend everyone interested in using this gem to first read the documentation of the [API](http://xmlsoccer.wikia.com/wiki/Main_Page)

Additionally, the author of the API has put a rate limit on all requests. The gem does check against last request times, but it is still worth knowing: http://xmlsoccer.wikia.com/wiki/Time_interval_limits

The available API calls are defined when you instantiate an Xmlsoccer::Client object.  Unlike the previous version of this gem, no specific call is hardcoded, rather the methods defined in the [xmlsoccer](http://www.xmlsoccer.com/FootballData.asmx?WSDL) documentation are dynamically defined. This change makes the gem much more lightweight but relies on the user to be conscious of the arguments passed to any method.

All methods and parameters that are listed on [xmlsoccer](http://www.xmlsoccer.com/FootballData.asmx?WSDL) need to be translated to snake case when using this gem. For example, `GetFixturesByDateInterval` should be  `get_fixtures_by_date_interval` and `'StartDateString'` should be `start_date_string`. Note that there are some limitations with this, "fixtureMatch_Id" is not translated properly from `fixture_match_id`, therefore in this case you can simply pass in as a parameter ("fixtureMatch_Id" => 123).
 

###Example Use

(You must have an API Key and know which type to use.  Currently there are two types Xmlsoccer::DEMO and Xmlsoccer::FULL)

XmlSoccer API GetFixturesByDateInterval

	xmlsoccer_client = Xmlsoccer::Client.new(api_key: 'Api_key', api_type:'Api_Type')

	response = xmlsoccer_client.get_fixtures_by_date_interval(start_date_string: '2014-01-01', end_date_string: '2014-02-01')
	
	response.each do |match|
		put match[:date]
	end


XmlSoccer Api GetAllLeagues


	xmlsoccer_client = Xmlsoccer::Client.new(api_key: 'Api_key', api_type:'Api_Type')

	response = xmlsoccer_client.get_all_leagues
	
	response.each do |league|
		put league[:name]
	end

###Exceptions

Xmlsoccer has a rate limit on nearly all of the Api methods ranging anywhere from 5 minutes to an hour.  Rather than this gem manage when calls are made or simply return the String response returned by the api, the gem raises an Exception. So be sure to form your methods to catch exceptions,

	begin
	  client.get_all_leagues
	rescue Exception => e
	 #handle rate limit
	end 


#Version 0.0.1

## Installation

Add this line to your application's Gemfile:

    gem 'xmlsoccer', "~> 0.0.1"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xmlsoccer -v 0.0.1

## Usage

The XmlSoccer API is a SOAP service so this gem uses the 'Savon' gem to interface.

I would recommend everyone interested in using this gem to first read the documentation of the API @ http://xmlsoccer.wikia.com/wiki/Main_Page

Additionally, the author of the API has put a rate limit on all requests. The gem does check against last request times, but it is still worth knowing: http://xmlsoccer.wikia.com/wiki/Time_interval_limits

Currently there is not support for Live Match Data.

Example Use:

XmlSoccer Api GetAllLeagues
(You must have an API Key and know which type to use.  Currently there are two types Xmlsoccer::DEMO and Xmlsoccer::FULL)

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
