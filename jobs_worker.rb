require 'json'
require 'httparty'

API_BASE_URI = 'http://jobdynamo.herokuapp.com'
API_VER = '/api/v2/'

def api_url(resource)
  URI.join(API_BASE_URI, API_VER, resource).to_s
end

puts "Worker started!"
puts "My task_id is #{@iron_task_id}"
puts "Parameters: '#{params}'"

saved_jobs = HTTParty.get api_url("offers")
saved_jobs.each do |offer|
  jobs_url = api_url("offers/#{offer['id']}")
  results = HTTParty.get jobs_url
  puts "Updated: #{offer['id']}"
end
