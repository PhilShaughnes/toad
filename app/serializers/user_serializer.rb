class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :photo_url, :email, :followed, :posts_count, :followers_count, :followees_count

  #has_many :posts

    def followed
      current_user ? object.followed_by?(current_user) : false
    end
end
