user ||= current_user

json.(user, :id, :email, :created_at, :updated_at)