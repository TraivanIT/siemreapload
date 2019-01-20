class Admin::NotificationsController < Admin::ApplicationController
  def index
  	@visitor_notifications = Notification.where(notifiable_type: 'Visitor').order(id: :desc)
  	@comment_notifications = Notification.where(notifiable_type: 'Comment').order(id: :desc)
  end

  def destroy
  	@notification = Notification.find(params[:id])
  	@notification.destroy 
  	redirect_back fallback_location: admin_notifications_url , notice: "Notification was successfull delete"
  end

  def delete_all
  	Notification.delete_all
  	redirect_back fallback_location: admin_notifications_url, notice: "Notification was delete all"
  end
end
