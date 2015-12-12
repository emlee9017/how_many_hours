class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    @user = User.find(current_user.id)
    @activities = Activity.all
    @enrollments = @user.enrollments
  end
end