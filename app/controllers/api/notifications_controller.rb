class Api::NotificationsController < Api::ApiController
  before_action :set_notification, only: [:show]
  before_filter :authenticate_owner_user!

  def index
    notifications = current_user.notifications_as_receiver.order(created_at: :desc)
    render json: notifications, each_serializer: NotificationSerializer, root: false, status: 200
  end

  def show
    render json: @notification, serializer:NotificationSerializer, root:false, status:200
  end

  def latest
    notitifications = current_user.notifications_as_receiver.order(clicked: :desc).order(created_at: :desc).limit(3)
    render json: notitifications, each_serializer: NotificationSerializer, root: false, status: 200
  end

  def unclicked_count
    notifications = current_user.notifications_as_receiver.unclicked
    counts = {}
    counts[:is_message] = notifications.where(is_message: true).count
    counts[:non_message] = notifications.where(is_message: false).count
    render json: counts, root: false, status: 200
  end

  def set_clicked
    @notification = Notification.find(params[:notification_id])
    @notification.clicked = true
    @notification.save
    render nothing:true, status: 200
  end

  private
  def set_notification
    @notification = Notification.find(params[:id])
  end

  def authenticate_owner_user!
    unless current_user.id == params[:user_id].to_i
      render :json => {:error => "Owner user only."}.to_json, :status => 403
    end
  end
end
