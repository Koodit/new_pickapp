class AppliedUserForDriverSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :user

  def user
    SlimUserSerializer.new(object.user, scope: scope, root: false)
  end
end
