require 'date'

class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user
  before_action :select_message,only: [:past_mondai,:note,:handout,:another,:task]

  def index
    @posts   = Post.where(subject_id:session[:subject_id])
    @subject = Subject.find_by(id:session[:subject_id])
  end

  def show
    @post = Post.new
    @subject = Subject.find_by(id:params[:id])
    @posts   = Post.where(subject_id:params[:id])
    session[:subject_id] = @subject.id
  end

  def create
    if params[:evaluate] && params[:evaluate].to_f >= 0.0 && params[:evaluate].to_f <=5.0
      @post = Post.new(
        content:    params[:content],
        level:      params[:evaluate],
        subject_id: params[:id]
      )
      if @post.save
        flash[:notice] = "投稿を作成しました"
        @s = Subject.find_by(id:params[:id])
        @s.level = Post.where(subject_id:params[:id]).sum(:level) / Post.where(subject_id:params[:id]).count
        @s.save

        redirect_to("/posts/#{params[:id]}")
      else
        flash[:notice] = "空白は入力できません&140字以内に収めてください"
        redirect_to("/posts/#{params[:id]}")
      end
    else
      flash[:notice]  = "0.0~5.0の範囲で入力してください"
      redirect_to("/posts/#{params[:id]}")
    end
  end

  def like
    @p = Post.find_by(id:params[:id])
    if @p.like
      @p.like = @p.like + 1
    else
      @p.like = 1
    end

    @p.save
    redirect_to("/posts/#{@p.subject_id}")
  end

  def bad
    @p = Post.find_by(id:params[:id])
    if @p.bad
      @p.bad = @p.bad + 1
    else
      @p.bad = 1
    end

    @p.save
    redirect_to("/posts/#{@p.subject_id}")
  end

  def past_mondai
    @post = Post.new
    @subject = Subject.find_by(id:params[:id])
    @posts = Past.where(subject_id:params[:id],name:"過去問").order(post_at:"DESC")
    @posts_data = []
    if @posts
      data = []
      now = nil
      @posts.each do |post|
        if post.post_at.year == now
          data.push(post)
          now = post.post_at.year
        else
          if data.length != 0
            @posts_data.push(data)
            data = []
            data.push(post)
            now = post.post_at.year
          else
            data.push(post)
            now = post.post_at.year
          end
        end
      end
      @posts_data.push(data)
    end
    session[:subject_id] = @subject.id
  end

  def note
    @post = Post.new
    @subject = Subject.find_by(id:params[:id])
    @posts = Past.where(subject_id:params[:id],name:"授業ノート").order(post_at:"DESC")
    @posts_data = []
    if @posts
      data = []
      now = nil
      @posts.each do |post|
        if post.post_at.year == now
          data.push(post)
          now = post.post_at.year
        else
          if data.length != 0
            @posts_data.push(data)
            data = []
            data.push(post)
            now = post.post_at.year
          else
            data.push(post)
            now = post.post_at.year
          end
        end
      end
      @posts_data.push(data)
    end
    session[:subject_id] = @subject.id
  end

  def handout
    @post = Post.new
    @subject = Subject.find_by(id:params[:id])
    @posts = Past.where(subject_id:params[:id],name:"配布資料").order(post_at:"DESC")
    @posts_data = []
    if @posts
      data = []
      now = nil
      @posts.each do |post|
        if post.post_at.year == now
          data.push(post)
          now = post.post_at.year
        else
          if data.length != 0
            @posts_data.push(data)
            data = []
            data.push(post)
            now = post.post_at.year
          else
            data.push(post)
            now = post.post_at.year
          end
        end
      end
      @posts_data.push(data)
    end
    session[:subject_id] = @subject.id
  end

  def task
    @post = Post.new
    @subject = Subject.find_by(id:params[:id])
    @posts = Past.where(subject_id:params[:id],name:"課題").order(post_at:"DESC")
    @posts_data = []
    if @posts
      data = []
      now = nil
      @posts.each do |post|
        if post.post_at.year == now
          data.push(post)
          now = post.post_at.year
        else
          if data.length != 0
            @posts_data.push(data)
            data = []
            data.push(post)
            now = post.post_at.year
          else
            data.push(post)
            now = post.post_at.year
          end
        end
      end
      @posts_data.push(data)
    end
    session[:subject_id] = @subject.id
  end
  def another
    @post = Post.new
    @subject = Subject.find_by(id:params[:id])
    @posts = Past.where(subject_id:params[:id],name:"その他").order(post_at:"DESC")
    @posts_data = []
    if @posts
      data = []
      now = nil
      @posts.each do |post|
        if post.post_at.year == now
          data.push(post)
          now = post.post_at.year
        else
          if data.length != 0
            @posts_data.push(data)
            data = []
            data.push(post)
            now = post.post_at.year
          else
            data.push(post)
            now = post.post_at.year
          end
        end
      end
      @posts_data.push(data)
    end
    session[:subject_id] = @subject.id
  end

  def select_message
    @room = Room.find_by(subject_id: params[:id])
    @messages = @room.messages
  end

end
