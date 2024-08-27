class ReservationsController < ApplicationController
    def index
        @address = params[:address]
        @info = params[:info]
        if Room.where(address: @address, info: @info).exists?
            @records = Room.where(address: @address, info: @info)
        elsif Room.where(address: @address).exists?
            @records = Room.where(address: @address)
        elsif Room.where(info: @info).exists?
            @records = Room.where(info: @info)
        else
            @records = Room.all
        end
    end

    def create
        @reservation = Reservation.new(params.require(:reservation)
        .permit(:image, :name, :info, :price, :check_in, :check_out, :persons, :user_id))
        if @reservation.save
            redirect_to new_reservation_path
        else
            redirect_to reservations
        end
    end

    def show
        @room = Room.find(params[:id])
        @reservation = Reservation.new
    end

    def new
        @reservation = Reservation.where(user_id: current_user.id)
    end

    def edit
        @reservation = Reservation.find(params[:id])
    end

    def update
        @reservation = Reservation.find(params[:id])
        if @reservation.update(params.require(:reservation)
            .permit(:check_in, :check_out, :persons, :created_at))
            redirect_to new_reservation_path
        else
            render "edit"
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        redirect_to new_reseration_path
    end
end
