module UserNotif
  module ViewHelpers
    include ::ActionView::Context
    include ::ActionView::Helpers

    def list_user_notifs(notifs = nil, small = true)
      return unless notifs
      output = ''

      notifs.each { |n| output << notif(n, small) }

      wrap output
    end

    def user_notif(notif, small = true)
      @notif = notif
        wrap render("notifications/#{small ? 'small' : 'full'}/#{notif.template_name}")
    end

    private

    def wrap(elem)
      "<div class=\"user-notif-wrapper\">#{elem}</div>".html_safe
    end
  end
end
