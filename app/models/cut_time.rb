class CutTime < ApplicationRecord

  belongs_to :user
  belongs_to :post, optional: true
  validates :second, presence: true, length: { in: 0..59 }, numericality: true
  validates :minute, presence: true, length: { in: 0..999 }, numericality: true

end
