class ForumThreadsController < ApplicationController

    def new
        @thread = ForumThread.new
        @section = Section.find(params[:section_id])
    end

    def create
        @thread = ForumThread.new(thread_params)
        p "1111111111111111111"
        p thread_params
        p @thread.title
        @section = @thread.section
        if @thread.save
            redirect_to @thread.section
        else
            p "NOT SAVEDD"
            @thread.errors.full_messages.each do |m|
                p m
            end
            render :new
        end
    end

    def show
    end

    private

    def thread_params
        params.require(:forum_thread).permit(:user_id, :section_id, :title, :text)
    end

end