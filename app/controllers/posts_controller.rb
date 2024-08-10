class PostsController < ApplicationController
  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
  end
  
  def create
      @post = Post.new(post_params)
      if @post.save
          redirect_to posts_path,notice: 'つぶやきを投稿しました'
      else
          renderf :new, status: :unprocessable_entity
      end
  end

  def edit
      @post = Post.find(params[:id])
  end
  
  def update
      @post = Post.find(params[:id])
      if @post.seave(post_params)
          redirect_to posts_path,notice: 'つぶやきを編集しました'
      else
          render :edit, status: :unprocessable_entity
      end
  end
  
  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path,notice: 'つぶやきを削除しました'
  end
  
  
  private
  
  def post_params
      params.require(:post).permit(:content)
  end
end
