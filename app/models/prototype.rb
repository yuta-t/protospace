class Prototype < ActiveRecord::Base
  # validations
  validates_presence_of :title, :catchcopy, :concept

  # setting for kaminari
  paginates_per 2

  # setting for kakurenbo-puti
  soft_deletable

  # associations
  belongs_to :user
  has_many :images
  has_many :comments

  # nested_attributes
  accepts_nested_attributes_for :images,
                     reject_if: :reject_image

  def reject_image
    attributed['name'].blank?
  end
end
