class Calender < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :public, inclusion: { in: [true, false] }
end
