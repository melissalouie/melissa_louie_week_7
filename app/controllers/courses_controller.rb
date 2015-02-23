class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @courses = Course.all
    else
      redirect_to root_path, notice: "You must be logged in to view this page."
    end
  end

  def new
    if current_user
      @course = Course.new
    else
      redirect_to root_path, notice: "You must be logged in to view this page."
    end
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course successfully created."
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def show
    if current_user
      @course = Course.find(params[:id])
    else
      redirect_to root_path, notice: "You must be logged in to view this page."
    end
  end

  def edit
    if current_user
      @course = Course.find(params[:id])
    else
      redirect_to root_path, notice: "You must be logged in to view this page."
    end
  end

  def update
    if @course.update(course_params)
      flash[:notice] = "Course successfully updated."
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:alert] = "Course successfully deleted."
    redirect_to courses_path
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :day_night)
  end
end
