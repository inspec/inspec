# Copyright 2016 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'google/apis/pubsub_v1'
require 'base_cli'


module Samples
  # Examples for the Google Cloud Pub/Sub API.
  #
  # Sample usage session:
  #
  #     $ ./google-api-samples pubsub create_topic mytopic --project=623040240964
  #     # ./google-api-samples pubsub subscribe mysub --topic=mytopic --project=623040240964
  #     $ ./google-api-samples pubsub publish 'Hello!' --topic=mytopic --project=623040240964
  #     $ ./google-api-samples pubsub pull mysub --project=623040240964
  #     Received: Hello!
  #     $ ./google-api-samples pubsub unsubscribe mysub --project=623040240964
  #     $ ./google-api-samples pubsub delete_topic mytopic --project=623040240964
  #
  class PubSub < BaseCli
    Pubsub = Google::Apis::PubsubV1

    desc 'create_topic TOPIC_NAME', 'Create a topic'
    method_option :project, type: :string, required: true
    def create_topic(name)
      pubsub = Pubsub::PubsubService.new
      pubsub.authorization = Google::Auth.get_application_default([Pubsub::AUTH_PUBSUB])
      topic = "projects/#{options[:project]}/topics/#{name}"

      pubsub.create_topic(topic)
    end

    desc 'delete_topic TOPIC_NAME', 'Delete a topic'
    method_option :project, type: :string, required: true
    def delete_topic(name)
      pubsub = Pubsub::PubsubService.new
      pubsub.authorization = Google::Auth.get_application_default([Pubsub::AUTH_PUBSUB])

      topic = "projects/#{options[:project]}/topics/#{name}"

      pubsub.delete_topic(topic)
    end

    desc 'subscribe SUBSCRIPTION_NAME', 'Subscribe to a topic'
    method_option :project, type: :string, required: true
    method_option :topic, type: :string, required: true
    def subscribe(name)
      pubsub = Pubsub::PubsubService.new
      pubsub.authorization = Google::Auth.get_application_default([Pubsub::AUTH_PUBSUB])

      topic = "projects/#{options[:project]}/topics/#{options[:topic]}"
      subscription = "projects/#{options[:project]}/subscriptions/#{name}"
      pubsub.create_subscription(subscription, Pubsub::Subscription.new(topic: topic))
    end

    desc 'unsubscribe subscription_name', 'Ububscribe from a topic'
    method_option :project, type: :string, required: true
    def unsubscribe(name)
      pubsub = Pubsub::PubsubService.new
      pubsub.authorization = Google::Auth.get_application_default([Pubsub::AUTH_PUBSUB])

      subscription = "projects/#{options[:project]}/subscriptions/#{name}"
      pubsub.delete_subscription(subscription)
    end


    desc 'publish MESSAGE', 'Publish a message to a topic'
    method_option :project, type: :string, required: true
    method_option :topic, type: :string, required: true
    def publish(message)
      pubsub = Pubsub::PubsubService.new
      pubsub.authorization = Google::Auth.get_application_default([Pubsub::AUTH_PUBSUB])
      topic = "projects/#{options[:project]}/topics/#{options[:topic]}"

      request = Pubsub::PublishRequest.new(messages: [])
      request.messages << Pubsub::Message.new(data: message)

      pubsub.publish_topic(topic, request)
    end

    desc 'pull SUBSCRIPTION_NAME', 'Pull message(s) from the topic'
    method_option :project, type: :string, required: true
    method_option :max, type: :numeric, default: 5
    def pull(name)
      pubsub = Pubsub::PubsubService.new
      pubsub.authorization = Google::Auth.get_application_default([Pubsub::AUTH_PUBSUB])

      subscription = "projects/#{options[:project]}/subscriptions/#{name}"

      # Pull messages
      response = pubsub.pull_subscription(subscription, Pubsub::PullRequest.new(max_messages: options[:max]))
      response.received_messages.each do |received_message|
        data = received_message.message.data
        puts "Received: #{data}"
      end

      # Acknowledge receipt
      ack_ids = response.received_messages.map{ |msg| msg.ack_id }
      pubsub.acknowledge_subscription(subscription, Pubsub::AcknowledgeRequest.new(ack_ids: ack_ids))
    end
  end
end
