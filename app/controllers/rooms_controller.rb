class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @course = Course.find(@room.course_id)
    @messages = @room.messages
  end
end
