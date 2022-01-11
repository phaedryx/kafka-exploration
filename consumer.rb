# frozen_string_literal: true

require 'kafka'

consumer = Kafka.new('localhost:9092', client_id: 'consumer').consumer(group_id: 'workers')

consumer.subscribe('greetings')

consumer.each_message { |msg| puts "offset: #{msg.offset} key: #{msg.key} value: #{msg.value}" }
