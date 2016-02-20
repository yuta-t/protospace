class TagsController < ApplicationController
  before_action :set_type

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
                                 .where('taggings_count > 0')
  end

  def show
    @tag = params[:tag_name]
    @prototypes = Prototype.tagged_with(@tag)
                           .without_soft_destroyed
                           .includes(:user, :main_image)
                           .order({likes_count: :DESC,
                                    created_at: :DESC})
                           .page(params[:page])
  end

  private
  def set_type
    @type = 'tags'
  end
end
