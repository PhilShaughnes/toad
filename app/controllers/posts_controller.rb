class PostsController < ApplicationController

  before_action :require_user, only: [:create]

  def index
    @post = current_user ? Post.timeline(current_user) : Post.order("created_at DESC")
    render json: @post
  end

  def show
    @post = User.find(params[:id]).posts
    render json: @post
  end
  #   if current_user
  #     @post = Post.timeline(current_user)
  #   else
  #     @post = Post.all
  #   end
  #   render json: @post
  # end

  def create
    p params
    @post = Post.new(:message)
    current_user.posts << @post
    if @post.save
      render json: @post
    else
      request_error(@post.errors.full_messages)
    end
  end

end
