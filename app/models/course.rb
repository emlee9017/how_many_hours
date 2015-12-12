class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, :through => :enrollments

  has_many :activities
  has_many :completions

  validates :course_num, :course_name, :presence => true
end
