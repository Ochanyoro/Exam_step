class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
  end


  def speak(data)
    Message.create! content: data['message'], user_id: params["user"], room_id: params['room']
  end
end
