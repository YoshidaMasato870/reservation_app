class UsersController < ApplicationController
    def top
    end

    def account
    end

    def profile
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(params.require(:user).permit(:user_icon, :name, :introduction))
            redirect_to profile_path
        else
            render profile_edit_path
        end
    end
end
