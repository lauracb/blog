class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order(:created_at)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path, notice: "Post created successfully"
    else
      flash[:alert] = "Post failed to be created. Try again"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path, notice: "El post fue actualizado exitosamente"
    else
      render :edit, alert: "El post falló en actualizar, intentalo de nuevo"
    end
  end

  def destroy
    post = Post.find(params[:id]) 
    post.destroy
    redirect_to posts_path, notice: "El post fue eliminado exitosamente"

  end

  private
    def post_params
      params.require(:post).permit(:user_id, :title, :body)
    end

end


