class HomeController < ApplicationController

  #before_action :forbid_login_user, {only: [:top]}
  before_action :teacher_id_delete_form_session
  before_action :subject_id_delete_form_session
  before_action :course_id_delete_form_session

  def top
    @users = User.all
  end
  def about
  end
  def show
    @users = User.all
  end
  def search
    @user = User.find_by(name:params[:name])
    if @user
      redirect_to("/users/#{@user.id}")
    else
      redirect_to("/")
    end
  end
end
