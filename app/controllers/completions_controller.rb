class CompletionsController < ApplicationController
  before_action :authenticate_user!, :only => [:new,:create,:edit,:update,:destroy]

  def index
    @completions = Completion.all
  end

  def show
    @completion = Completion.find(params[:id])
  end

  def new
    @completion = Completion.new
    @user = User.find(current_user.id)
    @activities = Activity.all
  end

  def create
    @completion = Completion.new
    @completion.user_id = params[:user_id]
    @completion.course_id = params[:course_id]
    @completion.activity_id = params[:activity_id]
    @completion.duration = params[:duration]
    @completion.completion = params[:completion]
    @completion.notes = params[:notes]

    if @completion.save
      redirect_to "/completions", :notice => "Completion created successfully."
    else
      render 'new'
    end
  end

  def edit
    @completion = Completion.find(params[:id])
  end

  def update
    @completion = Completion.find(params[:id])

    @completion.user_id = params[:user_id]
    @completion.course_id = params[:course_id]
    @completion.activity_id = params[:activity_id]
    @completion.duration = params[:duration]
    @completion.completion = params[:completion]
    @completion.notes = params[:notes]

    if @completion.save
      redirect_to "/completions", :notice => "Completion updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @completion = Completion.find(params[:id])

    @completion.destroy

    redirect_to "/completions", :notice => "Completion deleted."
  end
end
