require 'open-uri'
require 'json'

class Twitter
	def initialize
		base_url= "https://api.twitter.com/1/users/lookup.json?"
	end

	def getUser(username)
		query_url = base_url + "screen_name" + username
		result_json = open(query_url).read
		result = JSON.parse(result_json)
		return result
	end

end