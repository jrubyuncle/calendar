class Calender < ActiveRecord::Base
  include Archiveable

  belongs_to :user
  has_many :events

  validates :name, presence: true
  validates :public, inclusion: { in: [true, false] }
  accepts_nested_attributes_for :events, allow_destroy: true, reject_if: proc { |attributes| attributes['title'].blank? }
end
