class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.page(params[:page])
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    current_user.prototypes.create(create_params)
    redirect_to action: :index
  end

  def show
    @prototype = Prototype.find(params[:id])
    @user = @prototype.user
    @sub_images = @prototype.images.sub
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:name, :image_type])
  end
end
