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
            flash[:notice] = "プロフィールを更新しました" 
            redirect_to profile_path
        else
            flash.now[:alert] = "プロフィールの更新に失敗しました" 
            render profile_edit_path
        end
    end
end
