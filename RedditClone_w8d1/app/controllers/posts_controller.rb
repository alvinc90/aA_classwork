class PostsController < ApplicationController
    def show
        @post = Post.find_by(id: params[:id])
        render :show 
    end

    def new
        @post = Post.new 
        @subs = Sub.all
        render :new 
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        #create a post_subs instance!!
        if @post.save 
            redirect_to post_url(@post) 
        else
            flash[:errors] = @post.errors.full_messages
            render :new 
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit 
    end

    def update
        @post = current_user.posts.find_by(id: params[:id])
        if @post && @post.update(post_params) 
            redirect_to post_url(@post) 
        else
            flash[:errors] = @post.errors.full_messages
            render :edit 
        end
    end

    def destroy
        @post = current_user.posts.find_by(id: params[:id])
        if @post && @post.destroy 
            redirect_to subs_url
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content, :author_id, sub_ids:[])
    end

end

