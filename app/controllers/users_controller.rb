class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :edit, :update]}
  before_action :ensure_correct_user, {only: [:edit, :update,]}
  before_action :course_id_delete_form_session
  before_action :teacher_id_delete_form_session
  before_action :subject_id_delete_form_session


  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    session[:now_id] = params[:id]
  end

  def search
    @user = User.find_by(name:params[:name])
    if @user
      redirect_to("/users/#{@user.id}")
    else
      redirect_to("/users/index")
    end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      image_name: "default_user.jpg",
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    # メールアドレスのみを用いて、ユーザーを取得するように書き換えてください
    @user = User.find_by(name: params[:name])
    # if文の条件を&&とauthenticateメソッドを用いて書き換えてください
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:now_id]  = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @name = params[:name]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    session[:course_id] =nil
    session[:teacher_id] =nil
    session[:subject_id] = nil
    session[:now_id] =nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end


  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{session[:user_id]}")
    end
  end

end
