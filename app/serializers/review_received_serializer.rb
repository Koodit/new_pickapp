class ReviewReceivedSerializer < ActiveModel::Serializer
  attributes :id, :rating, :content, :user

  def user
    SlimUserSerializer.new(object.user, scope: scope, root: false)
  end
end
