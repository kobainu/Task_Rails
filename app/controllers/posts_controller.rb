class PostsController < ApplicationController
  # 一覧 => get
  def index
    # postsテーブルのレコードを全て取得
    @posts = Post.all
  end

  # 新規 => get
  def new
    @post = Post.new
  end

  # 作成 => post
  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @post.save
      flash[:notice] = "スケジュールを新規作成しました"
      redirect_to :posts
    else
      flash[:alert] = "スケジュールを作成できませんでした"
      render "new"
    end
  end

  # 詳細 => get
  def show
    @post = Post.find(params[:id])
  end

  # 編集 => get
  def edit
    @post = Post.find(params[:id])
  end

  # 更新 => patch
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash[:alert] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  # 削除 => delete
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end
end
