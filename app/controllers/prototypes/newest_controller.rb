class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.without_soft_destroyed
                           .includes(:user, :main_image)
                           .order(created_at: :DESC)
                           .page(params[:page])
    render template: 'prototypes/index'
  end
end
