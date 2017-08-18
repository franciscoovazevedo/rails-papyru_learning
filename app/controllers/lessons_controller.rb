class LessonsController < ApplicationController
  def change_status
    @lesson = Lesson.find(params[:id])
    @lesson.update(status: params[:status])
    redirect_to @lesson
  end

  def create
    byebug
    @teacher_subject = TeacherSubject.find(params[:teacher_subject_id])

    @lesson = Lesson.new(lesson_params)
    @lesson.teacher_subject = @teacher_subject
    @lesson.user = current_user
    @lesson.save
    redirect_to @teacher_subject.lessons.create(lesson_params.merge(user: current_user))
  end

  private

  def lesson_params
    params.require(:lessons).permit(:date)
  end
end
