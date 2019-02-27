class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id]) 
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    @comment.save

    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id]) 
    @comment = @post.comments.build(comment_params)
    @comment = @comment.find(params[:id]) 
    @comment.destroy
    redirect_to post_path(params[:id]), notice: "El comentario fue eliminado exitosamente"

  end

  private
 def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end
  
end
