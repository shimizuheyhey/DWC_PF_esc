class Post < ApplicationRecord

  acts_as_taggable

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #has_many :cut_times, dependent: :destroy
  has_one :cut_time, dependent: :destroy

  accepts_nested_attributes_for :cut_time, allow_destroy: true
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 1000}
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #def favorited_by?(user)
   # favorites.where(user_id: user.id).exists?
  #end
end