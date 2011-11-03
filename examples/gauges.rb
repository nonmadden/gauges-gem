$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'pp'
require 'rubygems'
require 'gauges'

ga = Gauges.new(:email => 'john@orderedlist.com', :password => 'testing')

puts 'Listing gauges'
pp ga.gauges.map { |gauge| gauge['service_value'] }
puts

puts 'Creating gauge'
gauge = ga.create_gauge({
  :title          => 'Testing',
  :service_value  => 'testing.com',
  :tz             => 'Eastern Time (US & Canada)'
})
pp gauge['title']
puts

puts 'Listing gauges'
pp ga.gauges.map { |gauge| gauge['service_value'] }
puts

puts 'Get gauge'
pp ga.gauge(gauge['id'])['title']
puts

puts 'Update gauge'
pp ga.update_gauge(gauge['id'], :title => 'New Title')['title']
puts

puts 'Get gauge'
pp ga.gauge(gauge['id'])['title']
puts

puts 'Deleting gauge'
pp ga.delete_gauge(gauge['id'])['title']
puts