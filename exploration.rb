# frozen_string_literal: true

require 'kafka'

kafka = Kafka.new('localhost:9092', client_id: 'exploration')

kafka.topics

kafka.each_message(topic: 'greetings') { |msg| puts "offset: #{msg.offset} key: #{msg.key} value: #{msg.value}" }