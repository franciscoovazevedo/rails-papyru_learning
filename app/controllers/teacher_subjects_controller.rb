  class TeacherSubjectsController < ApplicationController
  def index
    @subject = Subject.where(name: params[:subject]).first
    @teacher_subjects = TeacherSubject.where(subject_id: @subject.id)
  end

  def show
    find_teacher_subject
  end

  def new
    @teacher = current_user
    if @teacher.teacher?
      @teacher_subject = TeacherSubject.new
    else
      redirect_to @teacher_subject
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
    find_teacher_subject
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
    @teacher_subject = TeacherSubject.find(params[:id])
  end
end
