class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :calender, touch: true
end
