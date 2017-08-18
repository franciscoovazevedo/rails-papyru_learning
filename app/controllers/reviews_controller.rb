  class ReviewsController < ApplicationController
  before_action :find_lesson
  before_action :check_user
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.lesson = @lesson
    @review.user = current_user
    if @review.save
      redirect_to teacher_subject_path(@lesson.teacher_subject)
    else
      render :new
    end
  end

  private

  def check_user
    @lesson = Lesson.find(params[:lesson_id])
  end

  def find_lesson
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
