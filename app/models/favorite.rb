class Favorite < ApplicationRecord
  
  # ---- 下記2行を追加してください ---- #
  belongs_to :user
  belongs_to :post_image
  
end
