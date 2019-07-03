class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
      flash[:success] = "Erfolgreich gepostet"
      redirect_to @post
    else
      render 'new'
    end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post.update(post_params)
      @post.save
    end

    def index
      @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end

    private

  def post_params
    params.require(:post).permit(:text, :title)
  end
end
