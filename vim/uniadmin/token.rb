#!/usr/bin/env ruby
require 'rack/utils'

result = Rack::Utils.parse_query(URI(ARGV[0]).query)

puts "Secure Token:"
puts result["secure_token"]
