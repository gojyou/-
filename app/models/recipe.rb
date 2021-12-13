class Recipe < ApplicationRecord
  # アタッチメント
  attachment :image

  belongs_to :store
  has_many :favorites
  has_many :recipe_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :cooking_name, presence: true
  validates :recipe, presence: true
  validates :amount, presence: true
  validates :image, presence: true
end
