class CoursesController < ApplicationController
  before_action :authenticate_user, {only: [:index, :edit, :update]}
  before_action :ensure_correct_user, {only: [:edit, :update]}
  before_action :teacher_id_delete_form_session
  before_action :subject_id_delete_form_session


  def index
    @courses = Course.where(user_id:@current_user.id)
  end

  def show
    @course = Course.find_by(id:params[:id])
    session[:course_id] = @course.id
  end


  def edit
    @course = Course.find_by(id: params[:id])
  end


  def update
    @course = Course.find_by(id: params[:id])
    @course.name = params[:name]

    if params[:image]
      @course.image_name = "#{@course.id}.jpg"
      image = params[:image]
      File.binwrite("public/courses_images/#{@course.image_name}", image.read)
    end

    if @course.save
      flash[:notice] = "コース情報を編集しました"
      redirect_to("/courses/#{@course.id}")
    else
      flash[:notice] = "正しい情報を入力してください"
      redirect_to("/courses/#{@course.id}/edit")
    end
  end


  def new
    @course = Course.new
  end

  def create
    @course = Course.new(
      name: params[:name],
      image_name: "default_user.jpg",
      user_id:@current_user.id
    )
    if @course.save
      Room.create! course_id: @course.id
      session[:course_id] = @course.id
      flash[:notice] = "新しいコースを作成しました"
      redirect_to("/courses/#{@course.id}")
    else
      render("courses/new")
    end
  end


  def ensure_correct_user
    @course = Course.find_by(id: params[:id])
    if @current_user.id != @course.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end



end
