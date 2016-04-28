module UserNotif
  module ViewHelpers
    include ::ActionView::Context
    include ::ActionView::Helpers

    def list_notifs(notifs = nil, small = true)
      return unless notifs
      output = ''

      notifs.each { |n| output << notif(n, small) }

      output.html_safe
    end

    def notif(notif, small = true)
      @notif = notif
        render "notifications/#{small ? 'small' : 'full'}/#{notif.template_name}"
    end
  end
end
