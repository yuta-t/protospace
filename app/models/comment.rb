class Comment < ActiveRecord::Base
  # validations
  validates_presence_of :comment

  # setting for kakurenbo-puti
  soft_deletable

  # associations
  belongs_to :user
  belongs_to :prototype
end
