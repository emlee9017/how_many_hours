class EnrollmentsController < ApplicationController
  before_action :authenticate_user!, :only => [:new,:create,:edit,:update,:destroy]

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

    if @enrollment.save
      redirect_to "/users/current_user", :notice => "Enrollment created successfully."
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
