class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def index
    @likes = Like.where(user_id: @current_user.id)
  end

  def create
    @like = Like.new(
      user_id: @current_user.id,
      post_id: @post.id
    )
    @like.save
  end

  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      post_id: @post.id
    )
    @like.destroy
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end
end
