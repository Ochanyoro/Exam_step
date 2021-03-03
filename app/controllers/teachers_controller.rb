class TeachersController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user
  #before_action :teacher_id_delete_form_session
  before_action :subject_id_delete_form_session





  def show
    @teacher = Teacher.find_by(id:params[:id])
    session[:teacher_id] = params[:id]
  end

  def edit
    @teacher = Teacher.find_by(id: params[:id])
  end

  def update
    @teacher = Teacher.find_by(id: params[:id])
    @teacher.name = params[:name]

    if params[:image]
      @teacher.image_name = "#{@teacher.id}.jpg"
      image = params[:image]
      File.binwrite("public/teachers_images/#{@teacher.image_name}", image.read)
    end

    if @teacher.save
      flash[:notice] = "教授の情報を編集しました"
      redirect_to("/teachers/#{@teacher.id}")
    else
      flash[:notice] = "正しい情報を入力してください"
      redirect_to("/teachers/#{@teacher.id}/edit")
    end
  end

  def new
    @teacher = Teacher.new
    if session[:course_id]
      @course = Course.find_by(id:session[:course_id])
    else
      @course = Course.new
    end
  end

  def create
    if params[:id]
      @course  = Course.find_by(id:params[:id])
      @teacher = Teacher.new(
        name: params[:name],
        image_name: "default_user.jpg",
        course_id:params[:id].to_i
      )
    else
      @course  = Course.find_by(name:params[:course_name])
      if @course
        @teacher = Teacher.new(
          name: params[:name],
          image_name: "default_user.jpg",
          course_id:@course.id
        )
      else
        @course = Course.new
        @teacher = Teacher.new
        @error_message = "そのようなコースはありません。綴が間違っているか、そのようなコースが存在しない可能性ががあります。"
      end
    end
    if @teacher.save
      session[:teacher_id] = @teacher.id
      flash[:notice] = "新しいコースを作成しました"
      redirect_to("/teachers/#{@teacher.id}")
    else
      render("teachers/new")
    end
  end



  def ensure_correct_user
    if @current_user.id != session[:now_id].to_i
      flash[:notice] = "権限がありませんーーーーー"
      redirect_to("/")
    end
  end

end
