class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#follow
has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
has_many :followers, through: :reverse_of_relationships, source: :follower
has_many :followings, through: :relationships, source: :followed
#post
has_many :posts, dependent: :destroy
has_many :post_comments, dependent: :destroy
#favorite
has_many :favorites, dependent: :destroy
#cuttime
has_many :cut_times, dependent: :destroy
has_many :bookmarks, dependent: :destroy
validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
validates :body, length: { maximum: 50 }
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end