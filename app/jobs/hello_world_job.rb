# frozen_string_literal: true
class HelloWorldJob < ApplicationJob::Base
  queue_as :default
def perform
    puts 'Hello World!'
  end
end