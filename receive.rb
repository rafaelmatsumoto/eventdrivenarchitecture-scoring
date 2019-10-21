# frozen_string_literal: true

require './lib/publisher'
require './lib/scoring'
require 'colorize'
subscription_name = 'scoring-sub'

def print_success(lead_name, lead_email)
  puts "#{lead_name}, com o email #{lead_email}, teve o cartão aprovado".green
end

def print_error(lead_name, lead_email)
  puts "#{lead_name}, com o email #{lead_email}, teve o cartão reprovado".red
end

pubsub = Publisher.get_publisher

subscription = pubsub.subscription subscription_name
subscriber = subscription.listen do |received_message|
  lead = JSON.parse(received_message.data)
  result = Scoring.score(lead)
  if result
    Publisher.publish(lead["name"])
    print_success(lead["name"], lead["email"])
  else
    print_error(lead["name"], lead["email"])
  end
  received_message.acknowledge!
end

subscriber.start
sleep
