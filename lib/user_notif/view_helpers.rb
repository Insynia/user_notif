require 'devise' # NOT WORKING

module UserNotif
  module ViewHelpers
    include ::ActionView::Context
    include ::ActionView::Helpers
    include ::Devise::Controllers::Helpers # NOT WORKING

    def user_notifs(user = nil, unread = true, small = true)
      return unless user
      output = ''
      notifs = user.notifications # NOT WORKING
      notifs = notifs.unread if unread

      notifs.find_each do |notif|
        output << user_notif(notif, small)
      end

      output.html_safe
    end

    def current_user_notifs(unread = true, small = true)
      user_notifs(current_user, unread, small)
    end

    def user_notif(notif, small)
      render "notifications/#{small ? 'small' : 'full'}/#{notif.template_name}"
    end
  end
end