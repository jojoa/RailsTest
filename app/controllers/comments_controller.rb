class CommentsController < ApplicationController
    def new
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.save
          flash[:success] = "Erfolgreich kommentiert"
          redirect_to @post
        else
          render 'new'
        end
    end

    def edit
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end

    def update
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])

      @comment.update(comment_params)
      @comment.save

      redirect_to @post
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])

      @comment.destroy
      
      redirect_to @post
    end
    private

    def comment_params
      params.require(:comment).permit(:text)
    end
end
