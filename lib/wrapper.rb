require 'open-uri'
require 'json'
require 'oauth'

class Twitter
	def initialize
	end

	def base_url(request_type)
		case request_type
		when 'search'
			return "https://api.twitter.com/1.1/search/tweets.json?"
		when 'users'
			return "https://api.twitter.com/1/users/lookup.json?"
		end
	end

	def hash_to_query_string(hash)
		query_string = String.new
		hash.each do |key, value|
		  query_string += "#{key.to_s.downcase}=#{value.to_s.downcase},"
		end
		return query_string
	end

	def query_to_hash(request_type, query)
		base_url = base_url(request_type)
		url = URI.encode(base_url + query)
		result_json = open(url).read
		result = JSON.parse(result_json)
		return result
	end

	def users(args_hash)
		query = hash_to_query_string(args_hash)
		result = query_to_hash('users', query)
	end	

	def search(args_hash)
		query = hash_to_query_string(args_hash)
		result = query_to_hash('search', query )
		#result.length > 1? return result : return result.first
		return result
	end
end