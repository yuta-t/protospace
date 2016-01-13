class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images

  validates_presence_of :title, :catch_copy, :concept

  paginates_per 2
end
