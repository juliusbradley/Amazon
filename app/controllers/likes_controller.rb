class LikesController < ApplicationController
before_action :authenticate_user!

def create
  like    = Like.new
  review  = Review.find params[:review_id]
  like.review = review
  like.user = current_user
  review.user = current_user
  if cannot? :like, review
    redirect_to(
      product_path(review.product),
      alert: 'Liking your own question is disgusting'
    )
    return # early return to prevent execution of anything
    # after the redirect above
  end
  if like.save
    redirect_to product_path(review.product), notice: 'Thanks for the like'
  else
        redirect_to product_path(review.product), alert: like.errors.full_messages.join(', ')
      end
end


def destroy
  review = Review.find params[:review_id]
  like   = current_user.likes.find params[:id]
  if cannot? :like, like.review
    redirect_to(
      product_path(review.product),
      alert: 'Liking your own question is disgusting'
    )
    return
  end
  if like.destroy
      redirect_to question_path(like.question), notice: 'Un-liked question! ð'
    else
      redirect_to question_path(like.question), alert: like.errors.full_messages.join(', ')
    end
end

end
