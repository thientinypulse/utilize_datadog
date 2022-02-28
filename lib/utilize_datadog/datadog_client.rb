module UtilizeDatadog
  module DatadogClient
    extend self

    def post(title:, message:, level:, tags:)

      File.open('test.log', 'a') { |file| file.write("#{title} - #{message} - #{level} - #{tags}") }

      return

      # tags = tags << source_type_name
      # title = "[#{level.upcase}] #{title}"
      # event = ::Dogapi::Event.new(message, msg_title: title, tags: tags)
      # client.emit_event(
      #   event,
      #   host: host
      # )
    end

    private

    def client
      @client ||= ::Dogapi::Client.new(datadog_api_key)
    end

    def datadog_api_key
      ENV['DATADOG_API_KEY'] || "test_key"
    end

    def host
      ENV['CLUSTER_IDENTIFIER'] || "test_host"
    end

    def source_type_name
      "test_source_name"
    end
  end
end
