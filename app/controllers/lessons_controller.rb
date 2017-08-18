class LessonsController < ApplicationController
  def change_status
    @lesson = Lesson.find(params[:id])
    @lesson.update(status: params[:status])
    redirect_to @lesson
  end

  def create
    @teacher_subject = TeacherSubject.find(params[:teacher_subject_id])
    @lesson = Lesson.new(teacher_subject: @teacher_subject, date: @teacher_subject.begin, user: current_user)
    @lesson.save
    redirect_to profile_path(current_user)

  end
end
