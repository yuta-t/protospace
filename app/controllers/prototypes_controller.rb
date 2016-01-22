class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.without_soft_destroyed
                           .order(created_at: :DESC)
                           .page(params[:page])
  end

  def show
    @user = @prototype.user
    @sub_images = @prototype.images.sub
    @comments = @prototype.comments.without_soft_destroyed
    @comment = Comment.new
    @like = @prototype.likes.find_by(user_id: current_user.id) if user_signed_in?
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
    @sub_image_count = @prototype.images.sub.count
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
    params.require(:prototype).permit(:title, :catchcopy, :concept, images_attributes: [:id, :name, :image_type])
  end
end
