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
    private

    def comment_params
      params.require(:comment).permit(:text)
    end
end
