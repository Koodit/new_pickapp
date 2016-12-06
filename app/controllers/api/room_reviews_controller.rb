class Api::RoomReviewsController < Api::ApiController

  def create
    review = RoomReview.new(room_review_params)
    if review.save
      render json: review, serializer: RoomReviewSerializer, root: false, status: 200
    else
      render :json => {:error => "Si è verificato un errore"}.to_json, :status => 500
    end
  end

  def index
    reviews = RoomReview.where(room_id: params[:room_id]).order(created_at: :desc)
    render json: reviews, each_serializer: RoomReviewSerializer, root: false, status: 200
  end

  private
  def room_review_params
    params.require(:room_review).permit(:content, :rating, :author_id, :room_id)
  end
end
