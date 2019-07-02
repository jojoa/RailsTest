class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
      flash[:success] = "Erfolgreich gepostet"
      render 'show'
    else
      render 'new'
    end
    end

    def show
        @post = Post.find(params[:id])
    end
    

    private

  def post_params
    params.require(:post).permit(:text, :title)
  end
end
