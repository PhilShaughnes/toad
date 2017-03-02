class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :token, :first_name, :last_name, :photo_url, :email
end
