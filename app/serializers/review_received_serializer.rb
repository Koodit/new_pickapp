class ReviewReceivedSerializer < ActiveModel::Serializer
  attributes :id, :rating, :content, :user

  def user
    if object.user
      SlimUserSerializer.new(object.user, scope: scope, root: false)
    else
      {
        deleted: true,
        name: 'Utente',
        surname: 'Eliminato'
      }
    end
  end
end
