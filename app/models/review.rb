class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

has_many :likes, dependent: :destroy
has_many :users, through: :likes
  #validates :rating, presence: true, inclusion:

  def liked_by?(user)
    likes.find_by_user_id(user.id).present?
  end

end
