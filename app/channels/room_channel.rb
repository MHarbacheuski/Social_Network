class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room])#this work
    stream_for room# this work
  end
end