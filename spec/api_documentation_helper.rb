require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.configure do |config|
  config.before(:each) do |spec|
    if spec.metadata[:type].equal? :acceptance
      header 'Accept', 'application/json'
      header 'Content-Type', 'application/json'
    end
  end
end

module RspecApiDocumentation::DSL
  module Endpoint
    def sign_in(user = nil)
      user ||= create :user
      no_doc do
        client.post '/sessions', {email: user.email, password: user.password}
      end
      user
    end
  end
end
