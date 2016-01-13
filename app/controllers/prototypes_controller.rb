class PrototypesController < ApplicationController
  before_action :get_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.without_soft_destroyed
                           .page(params[:page])
  end

  def show
    @user = @prototype.user
    @sub_images = @prototype.images.sub
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    current_user.prototypes.create(create_params)
    redirect_to action: :index
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
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:name, :image_type])
  end
end
