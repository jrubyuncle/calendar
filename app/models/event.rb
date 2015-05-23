class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :calender, touch: true
  validates :title, :start, :end, presence: true
end
