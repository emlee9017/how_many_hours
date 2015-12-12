class ActivitiesController < ApplicationController
  before_action :authenticate_user!, :only => [:new,:create,:edit,:update,:destroy]

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def new_extra
    @activity = Activity.new
  end

  def create
    @activity = Activity.new
    @activity.course_id = params[:course_id]
    @activity.activity = params[:activity]

    if @activity.save
      redirect_to "/courses", :notice => "Activity created successfully."
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.course_id = params[:course_id]
    @activity.activity = params[:activity]

    if @activity.save
      redirect_to "/activities", :notice => "Activity updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    redirect_to "/activities", :notice => "Activity deleted."
  end
end
