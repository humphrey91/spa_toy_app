class FlashNotificationsJob < ApplicationJob
  queue_as :default

  def perform(user_id, type, message_b, message_r)
    notification = FlashService.new(type, message_b, message_r).perform
    ActionCable.server.broadcast "notifications_channel_#{user_id}", { notification: notification }
  end
end
