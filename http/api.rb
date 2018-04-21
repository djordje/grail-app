# frozen_string_literal: true

require 'grape'
require 'grape-swagger'

class API < Grape::API
  format :json

  mount V1
end
