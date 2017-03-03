class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :photo_url, :email#, :followed

  #has_many :posts

    # def followed
    #   object.followed_by(current_user) if current_user
    # end
end
