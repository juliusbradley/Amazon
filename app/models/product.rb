class Product < ApplicationRecord
belongs_to :category
belongs_to :user

has_many :reviews, dependent: :destroy



  after_initialize :set_defaults
  before_save :capitalize_title


def search(str)
SELECT FROM products WHERE title or description = str
end


private

def set_defaults
 price ||= 1
end




  def capitalize_title
    self.title.capitalize!
  end






end
