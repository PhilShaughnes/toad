class PostSerializer < ActiveModel::Serializer
  attributes :created_at, :message, :username, :photo_url

  def username
    object.user.username
  end

  def photo_url
    object.user.photo_url
  end
end
