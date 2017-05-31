class AmazonMailer < ApplicationMailer

  def notify_product_owner(product)
    @product = product
    @user = product.user
    mail(to: @user.email, subject: "#{@user.first_name} created a product")
  end
end
