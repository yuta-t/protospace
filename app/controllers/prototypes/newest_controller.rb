class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.without_soft_destroyed
                           .includes(:user, :main_image)
                           .order(created_at: :DESC)
                           .page(params[:page])
    @type = 'newest'
    render template: 'prototypes/index'
  end
end
