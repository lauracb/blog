class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_owner?, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order(:created_at).paginate(page: params[:page], per_page: 6)
    @lastpost = Post.last
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path, notice: "El post fue creado exitosamente"
    else
      flash[:alert] = "El post falló en crearse. Intenta de nuevo"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
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

    def is_owner?
      @post = Post.find(params[:id])
      unless current_user == @post.user
        redirect_to root_path, alert: "No tienes los permisos para realizar esta acción"
      end
    end

end


