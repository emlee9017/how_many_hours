class Activity < ActiveRecord::Base
  belongs_to :course
  has_many :completions

  validates :course_id, :presence => true
  validates :activity, :presence => true
end
