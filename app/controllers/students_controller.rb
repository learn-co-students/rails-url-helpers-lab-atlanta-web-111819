class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    set_student
  end

  def activate
    set_student
    # byebug
    if @student.active == false
      @student.update(active: true)
    else
      @student.update(active: false)
    end
    redirect_to action: "show"
  end


  private

    def set_student
      @student = Student.find(params[:id])
    end
end