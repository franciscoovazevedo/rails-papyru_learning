class TeacherSubjectsController < ApplicationController
  def index
    @teacher_subjects = TeacherSubject.all
  end

  def show
    @teacher_subject = TeacherSubject.find(params[:id])
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @teacher = User.find(params[:user_id])
    if @teacher.teacher?
      @teacher_subject = TeacherSubject.new
    else
      redirect_to root_path
    end
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_teacher_subject
    @teacher = TeacherSubject.find(params[:id])
  end
end
