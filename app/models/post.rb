class Post < ApplicationRecord

  belongs_to :user
  validates :user_id, presence: true
  has_one_attached :image

end
