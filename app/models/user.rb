class User < ApplicationRecord
  has_many :posts
  has_secure_password
  has_secure_token

  validates :first_name, :last_name,  presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true#validate email
  #validates :photo_url#validate url
end
