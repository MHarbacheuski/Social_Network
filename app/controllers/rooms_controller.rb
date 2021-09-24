class RoomsController < ApplicationController
  before_action :load_entities

  def index
    @rooms = Room.all
    @user = User.find_by(id:params[:user_id])
  end

  def new
    @friend_profile = Profile.find(params[:profile_id])
    @current_user_room = Room.joins(:user,:profile).where(user: current_user.id, profile:@friend_profile)
    @current_profile = current_user.profile
    @friend_room = Room.joins(:user,:profile).where(user: @friend_profile, profile:@current_profile)
    if @current_user_room.present?
      redirect_to room_path(id: @current_user_room.ids)
    elsif @friend_room.present?
      redirect_to room_path(id: @friend_room.ids)
    else
      @room = current_user.rooms.build(profile_id:@friend_profile.id)
      @room.room_messages.build(user_id: current_user.id)
    end
  end

  def create
    @room = current_user.rooms.create!(permitted_parameters)
    if @room.persisted?
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @room_message = RoomMessage.create(room:@room)
    @room_messages = @room.room_messages.includes(:user)
  end

  def destroy
    @room = Room.find(params[:id])
    @user = @room.user
    if @room.destroy
      redirect_to rooms_path(user_id:@user)
    else
      flash[:alert] = 'ggg'
    end
  end

  protected

  def load_entities
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:user_id, :profile_id,
                                 room_messages_attributes: [:id, :room_id, :user_id, :message])
  end
end
