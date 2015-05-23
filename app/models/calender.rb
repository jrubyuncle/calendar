class Calender < ActiveRecord::Base
  include Archiveable

  belongs_to :user
  has_many :events

  validates :name, presence: true
  validates :public, inclusion: { in: [true, false] }
  accepts_nested_attributes_for :events, allow_destroy: true, reject_if: proc { |attributes| attributes['title'].blank? }

  def to_ics
    cal = Icalendar::Calendar.new
    cal.timezone do |t|
      t.tzid = "Taipei"
    end
    events.each do |event|
      cal.event do |e|
        e.dtstart = event.all_day ? Icalendar::Values::Date.new(event.start) : event.start
        e.dtend = event.all_day ? Icalendar::Values::Date.new(event.end) : event.end
        e.summary = event.title
      end
    end
    cal.publish
    cal.to_ical
  end  
end
