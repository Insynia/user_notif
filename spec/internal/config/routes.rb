Rails.application.routes.draw do
  put '/notifs/:id', to: 'user_notif/notifs#read'
end
