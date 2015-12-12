class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, :through => :enrollments

  has_many :activities
  has_many :completions, :through => :activities

  validates :course_num, :course_name, :professor, :presence => true
  validates :course_num, numericality: true, :uniqueness => true 
end
