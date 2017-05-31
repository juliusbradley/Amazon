class Api::V1::ProductsController < ApplicationController
  def index
  @products = Product.all
  end

def show
@product = Product.find params[:id]
render json: @product
end

private

def authenticate_user
  @user = User.find_by_api_token params[:api_token]
  # head will send an empty HTTP response with a code that is inferred by the
  # symbol you pass as an argument to the `head` method
  head :unauthorized if @user.nil?
end



end
