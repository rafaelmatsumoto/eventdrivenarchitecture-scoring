# frozen_string_literal: true

require './lib/publisher'
require 'faker'
require 'json'
topic_name = 'credit-card-topic'

pubsub = Publisher.get_publisher

topic = pubsub.topic topic_name
20.times do
  my_hash = { name: "Rafael", email: "rafael@mailnator.com" }
  topic.publish my_hash.to_json
end

puts 'Credit card messages published.'
