  class TeacherSubjectsController < ApplicationController
  def index
    @teacher_subjects = TeacherSubject.all
  end

  def show
    @teacher_subject = TeacherSubject.find(params[:id])
  end

  def new
    @teacher = current_user
    if @teacher.teacher?
      @teacher_subject = TeacherSubject.new
    else
      redirect_to root_path
    end
  end

  def create
    @teacher_subject = TeacherSubject.new(teacher_subject_params)
    @teacher_subject.user = current_user
    if @teacher_subject.save
      redirect_to teacher_subject_path(@teacher_subject)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def teacher_subject_params
    params.require(:teacher_subject).permit(:end, :begin, :description, :price, :subject_id)
  end

  def find_teacher_subject
    @teacher = TeacherSubject.find(params[:id])
  end
end
