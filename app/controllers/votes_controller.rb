class VotesController < ApplicationController
def create
  review = Review.find params[:review_id]
  vote   = Vote.new is_up: params[:is_up],
            user: current_user,
            review: review
            if vote.save
  # using `redirec_to question` is the same as doing:
  # redirec_to question_path(question)
  redirect_to product, notice: 'vote recieved!'
else
  redirect_to product, alert: vote.errors.full_messages.join(', ')
end
end

def destroy
 vote = Vote.find params[:id]
 vote.destroy
redirect_to product_path(vote.product), notice: 'unvoted!'
end

def update
  vote = Vote.find params[:id]
  vote.is_up = params[:is_up]
  if vote.save
    redirect_to vote.product, notice: 'Vote changed'
  else
    redirect_to vote.product, alert: vote.errors.full_messages.join(', ')
end
end
end
