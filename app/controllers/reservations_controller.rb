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

    def confirm
        @reservation = Reservation.new(params.require(:reservation)
        .permit(:image, :name, :info, :price, :check_in, :check_out, :persons, :user_id, :room_id))
        if @reservation.invalid?
            flash[:alert] = "予約に失敗しました"
            render redirect_to reservation_path(@reservation.room_id)
        end
    end

    def confirm_change
        @id = params[:id]
        @new = Reservation.new(params.require(:reservation)
        .permit(:check_in, :check_out, :persons, :created_at))
        if @new.check_in == nil || @new.check_out == nil || @new.check_in > @new.check_out
            @new.persons ==nil || @new.persons < 1 
            flash[:alert] = "予約失敗しました"
            redirect_to edit_reservation_path(@id)
        end
        @reservation = Reservation.find(params[:id])
    end

    def create
        @reservation = Reservation.new(params.require(:reservation)
        .permit(:image, :name, :info, :price, :check_in, :check_out, :persons, :user_id, :room_id))
        if @reservation.save
            flash[:notice] = "予約を作成しました"
            redirect_to reserved_reservations_path
        else
            flash[:alert] = "予約に失敗しました"
            redirect_to reservation_path(@reservation.room_id)
        end
    end

    def show
        @room =Room.find(params[:id])
        @reservation = Reservation.new
    end

    def reserved
        @reservation = Reservation.where(user_id: current_user.id)
    end

    def edit
        @reservation = Reservation.find(params[:id])
    end

    def update
        @reservation = Reservation.find(params[:id])
        if @reservation.update(params.require(:reservation)
            .permit(:check_in, :check_out, :persons, :created_at))
            flash[:notice] = "再予約しました"
            redirect_to reserved_reservations_path
        else
            flash.now[:alert] = "再予約できませんでした"
            render "edit"
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        flash[:notice] = "予約を削除しました"
        redirect_to reserved_reservations_path
    end
end
