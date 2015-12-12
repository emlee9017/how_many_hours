class Completion < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  # validates :duration, numericality: true
  # validates :user, :uniqueness => {:scope => :activity_id}
 end


