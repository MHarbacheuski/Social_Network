# frozen_string_literal: true

class RoomMessagesController < ApplicationController
  before_action :load_entities

  def new
    @room_message = RoomMessage.new
  end

  def create
    @room_message = RoomMessage.create(
      user: current_user,
      room: @room,
      message: params.dig(:room_message, :message)
    )
    if @room_message.save
      head :ok
      RoomChannel.broadcast_to @room, { content: @room_message, name: current_user.profile.first_name }
    else
      render json: { errors: @room_message.errors }, status: :unprocessable_entity
    end
  end

  protected

  def load_entities
    @room = Room.find(params.dig(:room_message, :room_id))
  end
end
