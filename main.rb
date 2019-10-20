# frozen_string_literal: true

require './lib/publisher'
require './lib/scoring'
require 'colorize'
subscription_name = 'scoring-sub'

def handle_scores(result, lead_name, lead_email)
  if result
    puts "#{lead_name}, com o email #{lead_email}, teve o cartão aprovado".green
  else
    puts "#{lead_name}, com o email #{lead_email}, teve o cartão reprovado".red
  end
end

pubsub = Publisher.get_publisher

subscription = pubsub.subscription subscription_name
subscriber = subscription.listen do |received_message|
  lead = JSON.parse(received_message.data)
  result = Scoring.score(lead)
  handle_scores(result, lead["name"], lead["email"])
  received_message.acknowledge!
end

subscriber.start
sleep
