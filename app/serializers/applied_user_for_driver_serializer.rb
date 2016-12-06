class AppliedUserForDriverSerializer < ActiveModel::Serializer
  attributes :id, :created_at
  has_one :user, serializer: SlimUserSerializer
end
