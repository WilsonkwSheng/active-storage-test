class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_picture

  after_commit :add_default_cover, on: [:create, :update]

  def add_default_cover
    unless profile_picture.attached?
      profile_picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "user_default.png")), filename: 'user_default.png' , content_type: "image/png")
    end
  end
end
