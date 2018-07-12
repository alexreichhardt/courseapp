class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  has_many :course_reviews
  has_many :bookmarks, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
