message ||= @message

json.(message, :id, :content, :created_at, :updated_at)
json.user do 
  json.partial! '/messages/user', locals: { user: message.user }  
end

if message.user == current_user
  json.is_you true
else
  json.is_you false
end