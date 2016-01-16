class Prototypes::CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @prototype.comments.create(comment_params)
    @comments = @prototype.comments
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
          .merge(user_id: current_user.id)
  end
end
