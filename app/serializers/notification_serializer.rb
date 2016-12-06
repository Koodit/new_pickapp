class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :icon, :event, :importance, :clicked, :link, :params, :is_message
end
