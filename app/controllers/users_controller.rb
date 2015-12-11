class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    @user = User.find(current_user.id)
    @courses = @user.courses
    @enrollments = @user.enrollments
  end
end