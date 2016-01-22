class Prototypes::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_prototype, only: [:create, :destroy]

  def create
    @like = @prototype.likes.create(user_id: current_user.id)
  end

  def destroy
    Like.find(params[:id]).destroy
  end

  private
  def get_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
