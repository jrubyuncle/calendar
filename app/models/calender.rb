class Calender < ActiveRecord::Base
  include Archiveable

  belongs_to :user
<<<<<<< Updated upstream

  validates :name, presence: true
  validates :public, inclusion: { in: [true, false] }

=======
  has_many :events
  accepts_nested_attributes_for :events, allow_destroy: true, reject_if: proc { |attributes| attributes['title'].blank? }
>>>>>>> Stashed changes
end
