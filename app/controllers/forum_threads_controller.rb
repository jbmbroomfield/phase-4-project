class ForumThreadsController < ApplicationController

    def new
        @thread = ForumThread.new
    end

    def create
    end

    def show
    end

    private

    def thread_params
        params.require(:forum_thread).permit(:user, :title, :text)
    end

end