class Prototypes::RankingController < ApplicationController
  def index
    @prototypes = Prototype.without_soft_destroyed
                           .includes(:user, :main_image)
                           .order({likes_count: :DESC,
                                    created_at: :DESC})
                           .page(params[:page])
    render template: 'prototypes/index'
  end
end
