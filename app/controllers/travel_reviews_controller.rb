class TravelReviewsController < ApplicationController

  def update
    travel = Travel.find params[:travel_id]
    @travel_review = TravelReview.find params[:id]
    @travel_review.content = params[:travel_review][:content]
    @travel_review.rating = params[:travel_review][:rating]
    @travel_review.to_be_written = false
    if @travel_review.save
      NotificationWorker.perform_async("user_was_reviewed", @travel_review.user_id, @travel_review.target_id, options = {user_was_reviewed: true, travel_review_id: @travel_review.id})
      redirect_to room_travel_path(travel.room, travel)
    end
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