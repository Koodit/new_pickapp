class PrivateMessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :is_owner, :created_at
  has_one :author, serializer: SlimUserSerializer

  def author
    object.author
  end

  def is_owner
    object.author == scope.current_user
  end
end
