class PagesController < ApplicationController

    def index
        @sections = Section.all
    end

    def admins
        @admins = User.admins
    end

end