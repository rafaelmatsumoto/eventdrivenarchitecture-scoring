# frozen_string_literal: true

require 'google/cloud/pubsub'
require 'dotenv/load'

class Publisher
  @project_id = ENV['GCLOUD_PROJECT_ID']
  @key_file = ENV['GCLOUD_KEY']
  @publisher = Google::Cloud::Pubsub.new project: @project_id, keyfile: @key_file

  def self.get_publisher
    @publisher
  end

  def self.publish(lead_name)
    topic = @publisher.topic 'credit-card-topic'
    topic.publish lead_name
  end
end
