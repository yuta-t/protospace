class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :get_prototype, only: [:show, :edit, :update, :destroy]

  def show
    @comment = Comment.new
    @sub_images = @prototype.images.sub
    @comments = @prototype.comments
                          .without_soft_destroyed
                          .includes(:user)
    if user_signed_in?
      @like = @prototype.likes.find_by(user_id: current_user.id)
    end
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    current_user.prototypes.create(prototype_params)
    redirect_to root_path
  end

  def edit
    @prototype.images.build
  end

  def update
    @prototype.update(prototype_params)
    redirect_to root_path
  end

  def destroy
    @prototype.soft_destroy
    redirect_to root_path
  end

  private
  def get_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catchcopy, :concept, images_attributes: [:id, :name, :image_type]).merge(tag_list: tag_params)
  end

  def tag_params
    params.require(:prototype).require(:tags).values
  end
end
