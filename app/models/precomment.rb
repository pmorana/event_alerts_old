class Precomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  acts_as_votable 
end
