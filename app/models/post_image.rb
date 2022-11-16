class PostImage < ApplicationRecord
  has_one_attached :image  

  belongs_to :user  
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # ---- 追記ここから ---- #
  validates :shop_name, presence: true
  validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  # --- 追記ここまで --- #

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
