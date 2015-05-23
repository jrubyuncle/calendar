class Calender < ActiveRecord::Base
  include Archiveable

  belongs_to :user

  validates :name, presence: true
  validates :public, inclusion: { in: [true, false] }

end
