class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  # forbid_login_userメソッドを定義してください
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/")
    end
  end

  def course_id_delete_form_session
    session[:course_id] = nil
  end

  def teacher_id_delete_form_session
    session[:teacher_id] = nil
  end

  def subject_id_delete_form_session
    session[:subject_id] = nil
  end

  def ensure_correct_user
    if @current_user.id != session[:now_id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{session[:user_id]}")
    end
  end


end
