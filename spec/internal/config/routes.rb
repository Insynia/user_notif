Rails.application.routes.draw do
  put '/notifications/:id', to: 'user_notif/notifications#read'
end
