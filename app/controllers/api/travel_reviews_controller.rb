class Api::TravelReviewsController < Api::ApiController

  def update
    travel_review = TravelReview.find(params[:id])
    travel_review.content = params[:content]
    travel_review.rating = params[:rating]
    travel_review.to_be_written = false
    if travel_review.save
      NotificationWorker.perform_async("user_was_reviewed", travel_review.user_id, travel_review.target_id, options = {user_was_reviewed: true, travel_review_id: travel_review.id})
      render json: travel_review, root: false, status: 200
    else
      render :json => {:error => "Non è stato possibile aggiornare la recensione."}.to_json, :status => 500
    end
  end

  def show
    travel_review = TravelReview.find(params[:id])
    if current_user.id == travel_review.user_id
      render json: travel_review, serializer: TravelReviewAuthorSerializer, root: false, status: 200
    else
      render json: travel_review, serializer: TravelReviewTargetSerializer, root: false, status: 200
    end
  end

  def as_author
    travel_reviews = current_user.travel_reviews.order(created_at: :desc)
    render json: travel_reviews, each_serializer: TravelReviewAuthorSerializer, root: false, status: 200
  end

  def as_target
    travel_reviews = current_user.travel_reviews_as_target.already_written.order(created_at: :desc)
    render json: travel_reviews, each_serializer: TravelReviewTargetSerializer, root: false, status: 200
  end

  def latest_as_target
    travel_reviews = current_user.travel_reviews_as_target.already_written.order(created_at: :desc).limit(3)
    render json: travel_reviews, each_serializer: TravelReviewTargetSerializer, root: false, status: 200
  end

  private
  def authenticate_user_travel_member!
    @travel = Travel.find(params[:travel_id])
    unless @travel.passenger_travels.any?{|pt| pt.user_id == current_user.id} || @travel.applied_users.any?{|au| au.user_id == current_user.id} || @travel.approved_users.any?{|au| au.user_id == current_user.id} || @travel.driver_id == current_user.id
      render :json => {:error => "Authorized users only."}.to_json, :status => 403
    else
      if @travel.applied_users.any?{|au| au.user_id == current_user.id}
        if @travel.waiting_for_confirm
          render :json => {:error => "Authorized users only."}.to_json, :status => 403
        end
      end
    end
  end

end
