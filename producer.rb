# frozen_string_literal: true

require 'kafka'

GREETINGS = [
  'Hi',
  'Yo',
  'Hello',
  'Howdy',
  'G`day',
  'Salutations',
  'Hey',
  'Shalom'
].freeze

producer = Kafka.new('localhost:9092', client_id: 'producer').producer

100.times do |index|
  greeting = GREETINGS.sample
  producer.produce(greeting, key: index, topic: 'greetings')
  producer.deliver_messages
  puts greeting
  sleep(0.5)
end

producer.shutdown
