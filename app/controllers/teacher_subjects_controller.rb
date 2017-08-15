class TeacherSubjectsController < ApplicationController
  def index
    @teacher_subjects = TeacherSubject.all
  end

  def show
    @teacher_subject = TeacherSubject.find(params[:id])
  end

  def new
    @subject = TeacherSubject.find(params[:subject_id])
    @
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
