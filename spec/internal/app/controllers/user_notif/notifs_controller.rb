require_relative '../../models/notifs/foo_notif'

module UserNotif
  class NotifsController < ApplicationController
    def read
      set_notif
      raise ActiveRecord::RecordNotFound.new('Not Found') unless @notif
      @notif.update!(unread: false)
      render nothing: true
    end

    private

    def set_notif
      @notif = UserNotif::Notif.find(params[:id].to_i)
    end
  end
end