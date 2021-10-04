class ForumThreadsController < ApplicationController

    def new
        @thread = ForumThread.new
        @section = Section.find(params[:section_id])
    end

    def create
        @thread = ForumThread.new(thread_params)
        @section = @thread.section
        if @thread.save
            redirect_to section_thread_path(section_id: @section.id, id: @thread.id)
        else
            render :new
        end
    end

    def show
        @thread = ForumThread.find(params[:id])
        @posts = @thread.posts
        @post_count = @posts.count
    end

    private

    def thread_params
        params.require(:forum_thread).permit(
            :section_id,
            :title,
            post: [:user_id, :text,],
        )
    end

end