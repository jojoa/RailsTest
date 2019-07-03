class TagsController < ApplicationController
    def new
        @tag = Tag.new
    end

    def edit
        @tag = Tag.find(params[:id])
    end

    def update
        @tag = Tag.find(params[:id])
        @tag.update(tags_params)
        @tag.save
        redirect_to tags_path
    end

    def index
        @tags = Tag.all
    end

    def create
        @tag = Tag.new(tags_params)
        if @tag.save
            flash[:success] = "Erfolgreich einen Tag erstellt"
            redirect_to root_path
          else
            render 'new'
          end
    end

    def newbind
        @post = Post.find(params[:post_id])
        @tags = Tag.all
        @newtags = []
        @tags.each do |tag| 
            if !@post.tags.include?(tag)
                @newtags.push(tag)
            end
        end
        @tag = @post.tags.new
        
    end

    def createbind
        @post = Post.find(params[:post_id])
        @tag = Tag.find(params[:tag][:id])
        @post.tags.push(@tag)
        @post.save
        redirect_to post_path(@post)
    end

    def destroybind
        @post = Post.find(params[:post_id])
        @tag = Tag.find(params[:id])
        @post.tags.delete(@tag)
        @post.save
        redirect_to post_path(@post)
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to tags_path
    end

    private

    def tags_params
    params.require(:tag).permit(:name)
    end

    def bind_params
        params.permit(:tag)


    end

end
