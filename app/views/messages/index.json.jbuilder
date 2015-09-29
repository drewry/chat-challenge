messages ||= @messages

json.messages messages, partial: '/messages/message', as: :message