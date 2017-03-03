class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :photo_url, :email

  #has_many :posts
end
