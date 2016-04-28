module UserNotif
  class NotificationsController < ApplicationController::Base
    def read
      set_notif
      raise ActiveRecord::RecordNotFound.new('Not Found') unless @notif
      @notif.update!(unread: false)
      raise nothing: true
    end

    private

    def set_notif
      @notif = UserNotif::Notif.find(params[:id].to_i)
    end
  end
end