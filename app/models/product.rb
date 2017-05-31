class Product < ApplicationRecord
belongs_to :category
belongs_to :user

has_many :reviews, dependent: :destroy
has_many :taggings, dependent: :destroy
has_many :tags, through: :taggings



  after_initialize :set_defaults
  before_save :capitalize_title


def search(str)
SELECT FROM products WHERE title or description = str
end

def liked_by?(user)
  likes.find_by_user_id(user.id).present?
end

def votes_count
  #TODO in a single query
  votes.where(is_up: true).count - votes.where(is_up: false).count
end


private

def set_defaults
 price ||= 1
end




  def capitalize_title
    self.title.capitalize!
  end







end
