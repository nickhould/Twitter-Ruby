require_relative 'wrapper.rb'

twitter = Twitter.new

users = twitter.users(screen_name: 'SamuelRSolomon,NicholasHould')

# users.each do |user|
# 	puts user['screen_name']
# 	puts user['status']['text']
# end

# results = twitter.search(q: 'starterleague')['results']

# results.each do |tweets|
# 	puts tweets['text']
# end

users.each do |user|
	puts "#{user['screen_name']}: #{user['status']['text']}"
end

