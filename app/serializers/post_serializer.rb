class PostSerializer < ActiveModel::Serializer
  attributes :created_at, :message, :username

  def username
    object.user.username
  end
end
