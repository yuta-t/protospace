class PrototypesController < ApplicationController
  def index
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
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:name, :image_type])
  end
end
