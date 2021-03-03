class PastsController < ApplicationController
  before_action :confirm,only:[:new]
  before_action :find_past,only:[:show,:edit,:upload,:destroy]
  

  def index
    @past =Past.all
  end

  def show
  end

  def new
    @past = Past.new
    @subject = Subject.find_by(id:session[:subject_id])
  end

  def edit
  end

  def create
    if past_params[:level].to_f >= 0.0 && past_params[:level].to_f <= 5.0
      @past = Past.new(past_params)
      if @past.save
        flash[:notice] = "保存が完了しました"
        redirect_to("/posts/#{@past.subject_id}")
      else
        flash[:notice] = "保存ができませんでした"
        redirect_to("/pasts/new")
      end
    else
      flash[:notice] = "0.0から5.0の間で入力してください"
      redirect_to("/pasts/new")
    end
  end

  def update
    if @past.update(past_params)
      flash[:notice] = "上書き保存しました"
    else
    end

  end

  def destroy
    if @past.destroy
      flash[:notice] = "削除が完了しました。"
    else
    end
  end

  private

  def find_past
    @past = Past.find_by(id:params[:id])
  end

  def past_params
    params.require(:past).permit(
      :name,:post_at,:when,:level,:subject_id,images:[]
    )
  end

  def confirm
    if session[:subject_id]
    else
      flash[:notice] = "投稿する権限がありません"
      redirect_to("/")
    end
  end
end
