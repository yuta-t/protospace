class Prototypes::CommentsController < ApplicationController
  before_action :get_prototype, only: [:create, :destroy]

  def create
    @prototype.comments.create(comment_params)
    @comments = @prototype.comments.without_soft_destroyed
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.soft_destroy
    @comments = @prototype.comments.without_soft_destroyed
  end

  private
  def get_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
          .merge(user_id: current_user.id)
  end
end
