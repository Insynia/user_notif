module UserNotif
  class NotifsController < ApplicationController
    before_action :set_notif
    before_action :authorized?, only: [:read]

    def read
      set_notif
      raise ActiveRecord::RecordNotFound.new('Not Found') unless @notif
      raise ActiveRecord::RecordNotFound.new('Not Found') unless @notif
      @notif.update!(unread: false)
      render nothing: true
    end

    private

    def set_notif
      @notif = UserNotif::Notif.find(params[:id].to_i)
    end

    def authorized?
      # This method assumes you are using Devise. You can change it to use your custom logic.
      raise ActiveRecord::RecordNotFound.new('Not Found') unless @notif.owner == current_user
    end
  end
end