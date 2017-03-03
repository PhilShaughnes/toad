class PostsController < ApplicationController

  before_action :require_user, only: [:create]

  def index
    # if current_user
    #   @post = Post.timeline(current_user)
    # else
      @post = Post.all
    # end
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post
    if @post.save
      #render json: @post
      render json: Post.all
      #TODO: just render @post here
    else
      request_error(@post.errors.full_messages)
    end
  end

  def post_params
    params.permit(:message)
  end

end
