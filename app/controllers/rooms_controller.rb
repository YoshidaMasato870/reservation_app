class RoomsController < ApplicationController
    def index
        @rooms = Room.where(user_id: current_user.id)
    end
    
    def new
        @room = Room.new
    end

    def create
        @room = Room.new(params.require(:room).permit(:name, :info, :price, :address, :image, :user_id))
        if @room.save
            flash[:notice] = "施設の登録に成功しました" 
            redirect_to reservation_path(@room.id)
        else
            flash[:alert] = "施設の登録に失敗しました" 
            render new_room_path
        end
    end

    def edit
        @room = Room.find(params[:id])
    end

    def update
        @room = Room.find(params[:id])
        if @room.update(params.require(:room)
            .permit(:name, :info, :price, :address, :image))
            flash[:notice] = "施設の情報を更新しました" 
            redirect_to rooms_path
        else
            flash.now[:alert] = "施設の情報の更新に失敗しました" 
            render "edit"
        end
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        flash[:notice] = "施設の情報を削除しました" 
        redirect_to rooms_path
    end
end
