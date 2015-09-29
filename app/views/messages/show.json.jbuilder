message ||= @message

json.partial! '/messages/message', locals: { message: message }
