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
          redirect_to 'posts_path,notice: 'つぶやきを投稿しました'
      else
          renderf :new
      end
  end

  def edit
  end
  
  
  private
  
  def post_params
      params.require(:post).permit(:content)
  end
end
