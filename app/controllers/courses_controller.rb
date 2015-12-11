class CoursesController < ApplicationController
  before_action :authenticate_user!, :only => [:new,:create,:edit,:update,:destroy]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new
    @course.course_num = params[:course_num]
    @course.course_name = params[:course_name]
    @course.professor = params[:professor]

    if @course.save
      redirect_to "/courses", :notice => "Course created successfully."
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    @course.course_num = params[:course_num]
    @course.course_name = params[:course_name]
    @course.professor = params[:professor]

    if @course.save
      redirect_to "/courses", :notice => "Course updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    redirect_to "/courses", :notice => "Course deleted."
  end
end
