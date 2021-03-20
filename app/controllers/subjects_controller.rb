class SubjectsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update]}
  before_action :subject_id_delete_form_session



  def show
    @subject = Subject.find_by(id:params[:id])
    session[:subject_id] = @subject.id
  end

  def edit
    @subject = Subject.find_by(id: params[:id])
  end

  def update
    @subject = Subject.find_by(id: params[:id])
    @subject.name = params[:name]
    if params[:level]
      @subject.level = params[:level].to_i
    end

    if params[:image]
      @subject.image_name = "#{@subject.id}.jpg"
      image = params[:image]
      File.binwrite("public/subjects_images/#{@subject.image_name}", image.read)
    end

    if @subject.save
      flash[:notice] = "科目情報を編集しました"
      redirect_to("/posts/#{@subject.id}")
    else
      flash[:notice] = "正しく入力してください"
      redirect_to("/subjects/#{@subject.id}/edit")
    end
  end

  def new
    @subject = Subject.new
    if session[:teacher_id]
      @teacher = Teacher.find_by(id:session[:teacher_id])
    else
      @teacher = Teacher.new
    end
  end

  def create
    if params[:id]
      @teacher  = Teacher.find_by(id:params[:id])
      @subject = Subject.new(
        name: params[:name],
        image_name: "default_user.jpg",
        teacher_id:params[:id].to_i,
        #level:0,
      )
    else
      @course = Course.find_by(name:params[:course_name])
      if @course.id == Teacher.find_by(name:params[:teacher_name]).course_id
        @teacher = Teacher.find_by(course_id:@course.id)
        @subject = Subject.new(
          name: params[:name],
          image_name: "default_user.jpg",
          teacher_id:@teacher.id
        )
      else
        @teacher = Teacher.new
        @subject = Subject.new
        @error_message = "そのようなコースはありません。綴が間違っているか、そのようなコースが存在しない可能性ががあります。"
      end
    end
    if @subject.save
      session[:subject_id] = @subject.id
      Room.create! subject_id: @subject.id, name: "past_mondai"
      Room.create! subject_id: @subject.id, name: "note"
      Room.create! subject_id: @subject.id, name: "task"
      Room.create! subject_id: @subject.id, name: "handout"
      Room.create! subject_id: @subject.id, name: "another"
      Room.create! subject_id: @subject.id, name: "comment"


      flash[:notice] = "新しい科目を作成しました"
      redirect_to("/subjects/#{@subject.id}")
    else
      render("subjects/new")
    end
  end



  def ensure_correct_user
    @teacher = Teacher.find_by(id: session[:teacher_id])
    @course  = Course.find_by(id:@teacher.course_id)
    if @current_user.id != @course.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

end
