class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).without_count.per(5)
  end

  def show
    @post =Post.find_by(id: params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "いたずらはダメ"
      redirect_to("/posts")
    end
  end

private
  def post_params
    params.require(:post).permit(:content).merge(user_id: @current_user.id)
  end
end
