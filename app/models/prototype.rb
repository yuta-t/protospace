class Prototype < ActiveRecord::Base
  # nested_attributes
  accepts_nested_attributes_for :images

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
end
