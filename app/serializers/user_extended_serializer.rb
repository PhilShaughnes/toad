class UserExtendedSerializer < ActiveModel::Serializer
  attributes :username, :token, :first_name, :last_name, :photo_url, :email
end
