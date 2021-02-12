class Post < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cut_times, dependent: :destroy
  accepts_nested_attributes_for :cut_times, allow_destroy: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end