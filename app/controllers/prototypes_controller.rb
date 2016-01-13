class PrototypesController < ApplicationController
  before_action :get_prototype, only: [:show, :edit, :update, :delete]

  def index
    @prototypes = Prototype.page(params[:page])
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
    current_user.prototypes.create(prototype_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    @prototype.update(prototype_params)
    redirect_to root_path
  end

  def delete
  end

  private
  def get_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:name, :image_type])
  end
end
