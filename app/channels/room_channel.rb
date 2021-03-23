class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
  end


  def speak(data)
    if data['message'].include?('.jpg')
      kount = Message.count
      kount = kount.to_s
      puts "ここまではきてるよーーーーーーーーーーーー"
      File.binwrite("public/message_images/"+kount+".jpg", data["message"].read)
      if data["uuser"] != "nil"
        Message.create! content: kount+".jpg", user_id: params["user"], room_id: params['room']
      else
        Message.create! content: kount+".jpg", room_id: params['room']
      end
    else
      if data["uuser"] != "nil"
        Message.create! content: data['message'], user_id: params["user"], room_id: params['room']
      else
        Message.create! content: data['message'], room_id: params['room']
      end
    end
  end
end
