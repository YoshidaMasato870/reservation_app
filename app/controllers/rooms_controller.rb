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
            redirect_to rooms_path
        else
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
            redirect_to rooms_path
        else
            render "edit"
        end
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        redirect_to rooms_path
    end
end
