class PagesController < ApplicationController

    def admins
        @admins = User.admins
    end

end