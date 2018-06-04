#!/usr/bin/env ruby

class Bot < SlackRubyBot::Bot
  extend ActionView::Helpers::TextHelper

  match(/^(?<question>.*)$/) do |client, data, match|
    term = match[:question].partition(' ').last

    logger.info "searching for: #{term}"
    results = Document.search_for term

    message = results.map do |doc|
        "Let me tell you: #{truncate(doc.content.gsub(/(\r)\n/,' '), length: 20)} "\
        "#{Rails.application.routes.url_helpers.document_url(doc.id)}"
    end.join("\n")
    message << "\nTell me something new #{Rails.application.routes.url_helpers.new_document_url(content: term)}"

    client.say channel: data.channel,
               text: message
  end
end

SlackRubyBot::Client.logger.level = Logger::DEBUG

ENV['SLACK_API_TOKEN'] = Rails.application.credentials[:slack_bot_token]
Bot.run
