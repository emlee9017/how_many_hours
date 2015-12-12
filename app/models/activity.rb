class Activity < ActiveRecord::Base
  belongs_to :course
  has_many :completions

  validates :course_id, :activity, :presence => true
  validates :activity, :uniqueness => {:scope => :course_id}

  def activity_with_coursename
  	return "#{course.course_num} #{course.course_name} - #{activity}"  
  end
end
