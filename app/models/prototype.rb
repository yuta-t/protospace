class Prototype < ActiveRecord::Base
  # validations
  validates_presence_of :title, :catchcopy, :concept

  # setting for kaminari
  paginates_per 4

  # setting for kakurenbo-puti
  soft_deletable

  # associations
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :likes

  # indexで画像を表示するときクエリをすくなくする用
  # なぜかラムダが使えないので一番上の画像を取るようになってるが、
  # 普通にprototypeを投稿すればmainが一番上なので正常に見える
  has_one :main_image, class_name: "Image"

  # nested_attributes
  accepts_nested_attributes_for :images,
                     reject_if: :reject_image

  def reject_image(attributed)
    attributed['name'].blank?
  end
end
