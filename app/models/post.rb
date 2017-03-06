class Post < ApplicationRecord
  belongs_to :user, :counter_cache => true

  acts_as_likeable

  validates :message, presence: true, length: { minimum: 2, maximum: 160}

  def self.timeline(user)
    following_ids = user.followees(User).pluck(:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

  def self.search(search)
    where("message LIKE ?", "%#{search}%")
  end
end
