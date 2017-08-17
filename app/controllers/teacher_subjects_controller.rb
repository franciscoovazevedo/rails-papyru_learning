  class TeacherSubjectsController < ApplicationController
    before_action :find_teacher_subject, only: [:show, :edit, :update, :destroy]
    before_action :protect_teacher, only: [:edit, :update, :destroy]

  def index
    @subject = Subject.where(name: params[:subject]).first
    @teacher_subjects = TeacherSubject.where(subject_id: @subject.id)
  end

  def show
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
  end

  def update
    if @teacher_subject.update(teacher_subject_params)
      redirect_to find_teacher_subject
    else
      render :edit
    end
  end

  def destroy
    @teacher_subject.destroy
  end
  private

  def protect_teacher
    raise ActiveRecord::RecordNotFound unless current_user == @teacher_subject.user
  end

  def teacher_subject_params
    params.require(:teacher_subject).permit(:end, :begin, :description, :price, :subject_id)
  end

  def find_teacher_subject
    @teacher_subject = TeacherSubject.find(params[:id])
  end
end
