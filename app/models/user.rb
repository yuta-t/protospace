class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of [:user_name, :image, :profile, :occupation, :position]
  mount_uploader :image, ImageUploader

  has_many :prototypes
end
