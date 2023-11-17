# frozen_string_literal: true

require_relative 'recipients'

module MonkeyBusiness
  # Abstraction of the Surveymonkey message resource and associated methods
  class Messages < ApiResource
    def send(options = {})
      fail_without_id
      @options.merge!(options)
      @path += '/send'
      self
    end

    def recipients(options = {})
      fail_without_id
      @options.merge!(options)
      Recipients.new(@api, @options.merge(options), @path)
    end
  end
end
