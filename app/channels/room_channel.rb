class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
  end


  def speak(data)
    puts "うんこ"
    if data["uuser"] != "nil"
      Message.create! content: data['message'], user_id: params["user"], room_id: params['room']
    else
      Message.create! content: data['message'], room_id: params['room']
    end
  end
end
