class TagsController < ApplicationController
    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(tags_params)
        if @tag.save
            flash[:success] = "Erfolgreich einen Tag erstellt"
            render root
          else
            render 'new'
          end
    end

    def newbind
        @tags = Tag.all
        @post = Post.find(params[:post_id])
        @tag = @post.tags_to_post.new
        
    end

    def createbind
        @post = Post.find(params[:post_id])
        @tag = @post.tags_to_post.build(tag_id: params[:tags_to_post][:tag_id])
        debugger
        @tag.save
        redirect_to post_path(@tag)
    end

    def destroybind

    end

    private

    def tags_params
    params.require(:tag).permit(:name)
  end
    def bind_params
        params.permit(:tag)


    end

end
