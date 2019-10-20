# frozen_string_literal: true

require './lib/publisher'
require './lib/scoring'
subscription_name = 'scoring-sub'

pubsub = Publisher.get_publisher

subscription = pubsub.subscription subscription_name
subscriber = subscription.listen do |received_message|
  lead = JSON.parse(received_message.data)
  Scoring.score(lead)
  received_message.acknowledge!
end

subscriber.start
sleep
