class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new
    @enrollment.user_id = params[:user_id]
    @enrollment.course_id = params[:course_id]
    @enrollment.course_num = params[:course_num]
    @enrollment.course_name = params[:course_name]
    @enrollment.year = params[:year]
    @enrollment.quarter = params[:quarter]

    if @enrollment.save
      redirect_to "/enrollments", :notice => "Enrollment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  def update
    @enrollment = Enrollment.find(params[:id])

    @enrollment.user_id = params[:user_id]
    @enrollment.course_id = params[:course_id]
    @enrollment.course_num = params[:course_num]
    @enrollment.course_name = params[:course_name]
    @enrollment.year = params[:year]
    @enrollment.quarter = params[:quarter]

    if @enrollment.save
      redirect_to "/enrollments", :notice => "Enrollment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])

    @enrollment.destroy

    redirect_to "/enrollments", :notice => "Enrollment deleted."
  end
end
