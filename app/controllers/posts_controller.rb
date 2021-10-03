class PostsController < ApplicationController

    before_action :require_login

    def new
        @post = Post.new
        @thread = ForumThread.find(params[:thread_id])
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to section_thread_path(section_id: @post.thread.section.id, id: @post.thread.id)
        else
            render :new
        end
    end
    
    private

    def post_params
        params.require(:post).permit(:user_id, :thread_id, :text)
    end

end