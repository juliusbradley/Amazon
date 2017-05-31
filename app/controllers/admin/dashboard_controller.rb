class Admin::DashboardController < ApplicationController

def index
  @user = User.order(:id)
  @product_count = Product.count
  @review_count = Review.count
 end
end
